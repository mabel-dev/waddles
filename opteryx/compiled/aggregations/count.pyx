# distutils: language = c++
# cython: language_level=3
# cython: nonecheck=False
# cython: cdivision=True
# cython: initializedcheck=False
# cython: infer_types=True
# cython: wraparound=False
# cython: boundscheck=False

from libcpp.unordered_map cimport unordered_map
from libc.stdint cimport int64_t
from libcpp.string cimport string

cimport numpy as cnp

import numpy

from opteryx.third_party.abseil.containers cimport KVMap, KVMapStr



cpdef KVMap counter(int64_t[:] values, KVMap accumulator):
    cdef Py_ssize_t n = values.shape[0]
    cdef Py_ssize_t i

    if accumulator is None:
        accumulator = KVMap()

    for i in range(n):
        accumulator.count(values[i], 0)

    return accumulator


cpdef KVMapStr counter_string(cnp.ndarray values, KVMapStr accumulator):
    cdef Py_ssize_t n = values.shape[0]
    cdef Py_ssize_t i

    if accumulator is None:
        accumulator = KVMapStr()

    for i in range(n):
        accumulator.count(values[i], 0)

    return accumulator