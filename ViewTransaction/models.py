from django.db import models

# Create your models here.
class ViewTransaction(models.Model):
    customer_id = models.IntegerField()
    date = models.DateField()
    username = models.CharField(max_length=250)
    name  = models.CharField(max_length=250)
    hp = models.IntegerField()
    

    class Meta:
        db_table = "view_transaction"