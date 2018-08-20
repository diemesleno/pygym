from django.test import TestCase

from model_mommy import mommy


class TestPlan(TestCase):
    """
    TestCase to test the Plan Model
    """
    def setUp(self):
        self.models = mommy.make('Plan')

    def test__str__(self):
        """
        Ensure if the str returned has the same value created
        """
        self.assertEquals(str(self.models), self.models.name)
