from django.db import models

# Create your models here.
class TransactionDetails(models.Model):
    id = models.AutoField(primary_key=True)
    transaction_id = models.IntegerField()
    product_id = models.IntegerField()
    qty = models.IntegerField()
    price = models.FloatField()
    sub_total = models.FloatField()

    class Meta:
        db_table = "transaction_details"