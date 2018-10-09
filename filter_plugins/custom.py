__author__ = 'henryshue'

import re
import os.path
from six import string_types

def append_to_list(values=[], suffix=''):
    if isinstance(values, string_types):
        values = values.split(',')
    return [str(value+suffix) for value in values]

def array_to_str(values=[],separator=','):
    return separator.join(values)

class FilterModule(object):
    def filters(self):
        return {'append_to_list':append_to_list,
        'array_to_str':array_to_str}
