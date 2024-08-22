from django.db import models

# Create your models here.
class Transactions(models.Model):
    id = models.AutoField(primary_key=True)
    customer_id = models.IntegerField()
    date = models.DateField()

    class Meta:
        db_table = "transaction"