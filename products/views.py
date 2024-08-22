from django.shortcuts import render
from .models import Products
from customer.models import Customers
from cart.models import Cart
from ViewCart.models import ViewCart
from Transactions.models import Transactions
from TransactionDetails.models import TransactionDetails
from ViewTransaction.models import ViewTransaction
from ViewTransactionDetail.models import ViewTransactionDetail
from django.shortcuts import render,redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.forms import UserCreationForm,AuthenticationForm
from crewbig.middleware import auth, guest
from django.http import HttpResponse
from django.http import JsonResponse
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from crewbig.forms import UserLoginForm
from django.db import connection
import json
import datetime

def addProduct(request):
    data_employee = request.session.get('data_employee')
    if data_employee == None:
        return redirect('/loginEmployee')
    products = {}
    return render(request,'add-products.html',{'products':products})

def dataProduct(request):
    data_employee = request.session.get('data_employee')
    if data_employee == None:
        return redirect('/loginEmployee')
    products = Products.objects.all()
    return render(request,'products.html',{'products':products})


def editProduct(request,id):
    data_employee = request.session.get('data_employee')
    if data_employee == None:
        return redirect('/loginEmployee')
    products = Products.objects.get(id=id)
    return render(request,'edit-products.html',{'products':products})


def updateProduct(request,id):
    data_employee = request.session.get('data_employee')
    if data_employee == None:
        return redirect('/loginEmployee')
    id = request.POST['id']
    name = request.POST['name']
    price = request.POST['price']
    stock = request.POST['stock']

    Products.objects.filter(id=id).update(name=name,price=price,stock=stock)
    return redirect('/dataProduct')


def insertProduct(request):
    data_employee = request.session.get('data_employee')
    if data_employee == None:
        return redirect('/loginEmployee')
    name = request.POST['name']
    price = request.POST['price']
    stock = request.POST['stock']
    # Handle the file here
    uploaded_file = request.FILES['file']
    with open(f'static/{uploaded_file.name}', 'wb+') as destination:
        for chunk in uploaded_file.chunks():
            destination.write(chunk)
    Products.objects.create(name=name,price=price,stock=stock,image=uploaded_file.name)
    return redirect('/dataProduct')


def deleteProduct(request,id):
    data_employee = request.session.get('data_employee')
    if data_employee == None:
        return redirect('/loginEmployee')
    products = Products.objects.get(id=id)
    products.delete()
    
    return redirect('/dataProduct')


def loginEmployee(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
      
        cursor = connection.cursor()
        query = 'SELECT id FROM employee where username="{}" and password="{}"'.format(username,password)
        cursor.execute(query)
        employee = cursor.fetchone()
        
        if employee == None:
            message = 'Username atau Password Salah !'
            return render(request,'employee-login.html',{'message':message})
        else:
            request.session['data_employee'] = employee
            return redirect('/dataProduct')

    return render(request,'employee-login.html')

def logout(request):
    request.session.flush()
    return redirect('/loginEmployee')


# Customer 

def dataCustomer(request):
    data_employee = request.session.get('data_employee')
    if data_employee == None:
        return redirect('/loginEmployee')
    customers = Customers.objects.all()
    return render(request,'customers.html',{'customers':customers})

def dataProducts(request):
    products = Products.objects.all()
    return render(request,'data-products.html',{'products':products})

def daftarCustomer(request):
    customers = Customers.objects.all()
    return render(request,'register-customer.html',{'customers':customers})

def addCustomer(request):
    username = request.POST['username']
    password = request.POST['password']
    tgl_lahir = request.POST['tgl_lahir']
    name = request.POST['name']
    address = request.POST['address']
    hp = request.POST['hp']
    
    Customers.objects.create(username=username,password=password,tgl_lahir=tgl_lahir,name=name,address=address,hp=hp)
    return redirect('/daftarCustomer')

def deleteCustomer(request,id):
    customers = Customers.objects.get(id=id)
    customers.delete()
    
    return redirect('/dataCustomer')

def loginCustomer(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
      
        cursor = connection.cursor()
        query = 'SELECT id FROM customer where username="{}" and password="{}"'.format(username,password)
        cursor.execute(query)
        customer = cursor.fetchone()
        
        if customer == None:
            message = 'Username atau Password Salah !'
            return render(request,'customer-login.html',{'message':message})
        else:
            request.session['data_customer'] = customer
            return redirect('/')

    return render(request,'customer-login.html')


def cart(request,id):
    data_customer = request.session.get('data_customer')
 
    if data_customer == None:
        return redirect('/loginCustomer')
    else:
        id_customer = 0
        for data_customer in request.session['data_customer']:
            id_customer = data_customer
        #insert data to cart
        Cart.objects.create(product_id=id,qty=1,customer_id=id_customer)
        # get data cart 
        carts = ViewCart.objects.filter(customer_id=id_customer)
        customers = Customers.objects.get(id=id_customer)
        return render(request,'cart.html',{'customers':customers,'carts':carts})

def logoutCustomer(request):
    request.session.flush()
    return redirect('/loginCustomer')

def checkout(request):
    date_now = datetime.datetime.now()
  
    data_customer = request.session.get('data_customer')
    if data_customer == None:
        return redirect('/loginCustomer')
    id_customer = 0
    for data_customer in request.session['data_customer']:
        id_customer = data_customer
    #insert to transaction
    Transactions.objects.create(customer_id=id_customer,date=date_now)
     # get id transaction
    id_transaction = Transactions.objects.latest("id")
    id_transaction = str(id_transaction)
    id_transaction = id_transaction.replace("Transactions object (","")
    id_transaction = id_transaction.replace(")","")
   
    # get all data from cart 
    carts = ViewCart.objects.filter(customer_id=id_customer)
    total = 0
    for cart in carts:
        product_id = cart.product_id
        qty = cart.qty
        price = cart.price
        sub_total = price*qty
        total = total + sub_total
        # insert to transaction_detail
        TransactionDetails.objects.create(product_id=product_id,transaction_id=id_transaction,qty=qty,price=price,sub_total=sub_total)
        # update stock from product
        product = Products.objects.get(id=product_id)
        stock = product.stock
        new_stock = stock - qty
        Products.objects.filter(id=product_id).update(stock=new_stock)
    # delete data from cart
    Cart.objects.filter(customer_id=id_customer).delete()

    #get data from transaction
    transactions = ViewTransactionDetail.objects.filter(transaction_id=id_transaction)
    customers = Customers.objects.get(id=id_customer)
    cursor = connection.cursor()
    query = 'SELECT sum(sub_total) FROM transaction_details where transaction_id="{}"'.format(id_transaction)
    cursor.execute(query)
    total = cursor.fetchone()
    total = str(total)
    total = total.replace("(","")
    total = total.replace(")","")
    return render(request,'checkout.html',{'transactions':transactions,'customers':customers,'total':total})

def transactions(request):
    data_employee = request.session.get('data_employee')
    if data_employee == None:
        return redirect('/loginEmployee')

    transactions = ViewTransaction.objects.all()
    return render(request,'transactions.html',{'transactions':transactions})

def deleteTransaction(request,id):
    data_employee = request.session.get('data_employee')
    if data_employee == None:
        return redirect('/loginEmployee')
    transactions = Transactions.objects.get(id=id)
    transactions.delete()
    
    return redirect('/transactions')


def transactiondetails(request,id):
    transactions_details = ViewTransactionDetail.objects.filter(transaction_id=id)
    cursor = connection.cursor()
    query = 'SELECT sum(sub_total) FROM transaction_details where transaction_id="{}"'.format(id)
    cursor.execute(query)
    total = cursor.fetchone()
    total = str(total)
    total = total.replace("(","")
    total = total.replace(")","")
    return render(request,'transaction-details.html',{'transaction_details':transactions_details,'total':total})


def customerTransaction(request):
    data_customer = request.session.get('data_customer')
    if data_customer == None:
        return redirect('/loginCustomer')
    id_customer = 0
    for data_customer in request.session['data_customer']:
        id_customer = data_customer
    transactions = ViewTransaction.objects.filter(customer_id=id_customer)
    return render(request,'customer-transaction.html',{'transactions':transactions})

def customerTransactionDetails(request,id):
    data_customer = request.session.get('data_customer')
    if data_customer == None:
        return redirect('/loginCustomer')
    id_customer = 0
    for data_customer in request.session['data_customer']:
        id_customer = data_customer
    transactions_details = ViewTransactionDetail.objects.filter(transaction_id=id)
    cursor = connection.cursor()
    query = 'SELECT sum(sub_total) FROM transaction_details where transaction_id="{}"'.format(id)
    cursor.execute(query)
    total = cursor.fetchone()
    total = str(total)
    total = total.replace("(","")
    total = total.replace(")","")
    return render(request,'customer-transaction-detail.html',{'transaction_details':transactions_details,'total':total})