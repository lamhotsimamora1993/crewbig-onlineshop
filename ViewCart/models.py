from django.db import models

# Create your models here.
class ViewCart(models.Model):
    id = models.AutoField(primary_key=True)
    product_id = models.IntegerField()
    qty = models.IntegerField()
    customer_id = models.IntegerField()
    name = models.CharField(max_length=250)
    price = models.FloatField()
    image = models.CharField(max_length=250)

    class Meta:
        db_table = "view_cart"