from django.db import models

# Create your models here.
class Customers(models.Model):
    id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=250)
    password = models.CharField(max_length=250)
    tgl_lahir = models.DateField()
    name = models.CharField(max_length=250)
    address = models.CharField(max_length=250)
    hp = models.FloatField()

    class Meta:
        db_table = "customer"