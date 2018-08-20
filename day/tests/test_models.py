from django.test import TestCase

from model_mommy import mommy


class TestDay(TestCase):
    """
    TestCase to test the Day Model
    """
    def setUp(self):
        self.models = mommy.make('Day')

    def test__str__(self):
        """
        Ensure if the str returned has the same value created
        """
        self.assertEquals(str(self.models), str(self.models.day_number))
