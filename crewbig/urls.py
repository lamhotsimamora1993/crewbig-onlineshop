from django.urls import include, path
from django.contrib import admin
from django.urls import path
from employee import views
from products import views


urlpatterns = [
    #path('admin/', admin.site.urls),
     path("addProduct/",views.addProduct,name="addProduct"),
     path("insertProduct/",views.insertProduct,name="insertProduct"),
     path("editProduct/<int:id>",views.editProduct,name="editProduct"),
     path("updateProduct/<int:id>",views.updateProduct,name="updateProduct"),
     path("dataProduct/",views.dataProduct,name="dataProduct"),
     path("deleteProduct/<int:id>",views.deleteProduct,name="deleteProduct"),
     path("loginEmployee/",views.loginEmployee,name="loginEmployee"),
     path("logout/",views.logout,name="logout"),

     path("dataCustomer/",views.dataCustomer,name="dataCustomer"),

     path("",views.dataProducts,name="dataProducts"),
     path("daftarCustomer/",views.daftarCustomer,name="daftarCustomer"),
     path("addCustomer/",views.addCustomer,name="addCustomer"),
     path("deleteCustomer/<int:id>",views.deleteCustomer,name="deleteCustomer"),
     path("loginCustomer/",views.loginCustomer,name="loginCustomer"),

     path("cart/<int:id>",views.cart,name="cart"),
     path("logoutCustomer/",views.logoutCustomer,name="logoutCustomer"),

     path('checkout/',views.checkout,name="checkout"),
     path('transactions/',views.transactions,name="transactions"),
     path("deleteTransaction/<int:id>",views.deleteTransaction,name="deleteTransaction"),
     path("transactiondetails/<int:id>",views.transactiondetails,name="transactiondetails"),

     path("customerTransaction",views.customerTransaction,name="customerTransaction"),
     path("customerTransactionDetails/<int:id>",views.customerTransactionDetails,name="customerTransactionDetails"),
]
