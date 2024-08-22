from django.db import models

# Create your models here.
class Cart(models.Model):
    id = models.AutoField(primary_key=True)
    product_id = models.IntegerField()
    qty = models.IntegerField()
    customer_id = models.IntegerField()

    class Meta:
        db_table = "cart"