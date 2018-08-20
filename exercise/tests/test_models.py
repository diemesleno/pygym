from django.test import TestCase

from model_mommy import mommy


class TestExercise(TestCase):
    """
    TestCase to test the Exercise Model
    """
    def setUp(self):
        self.models = mommy.make('Exercise')

    def test__str__(self):
        """
        Ensure if the str returned has the same value created
        """
        self.assertEquals(str(self.models), self.models.name)
