from django.db import models

# Create your models here.
class ViewTransactionDetail(models.Model):
    product_id = models.IntegerField()
    transaction_id = models.IntegerField()
    qty = models.IntegerField()
    price = models.FloatField()
    sub_total = models.FloatField()
    name = models.CharField(max_length=250)
    stock = models.IntegerField()
    image = models.CharField(max_length=250)

    class Meta:
        db_table = "view_transaction_detail"