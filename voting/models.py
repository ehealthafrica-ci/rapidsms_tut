from django.db import models


class Choice(models.Model):
    name = models.CharField(max_length=40, unique=True)
    votes = models.IntegerField(default=0)

    def __unicode__(self):
        return '{} with {} votes'.format (self.name, self.votes)
