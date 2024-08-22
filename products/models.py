from django.db import models

# Create your models here.
class Products(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=250)
    price = models.FloatField()
    stock = models.IntegerField()
    image = models.CharField(max_length=250)

    class Meta:
        db_table = "products"