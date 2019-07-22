def make_adder(n):
    """return a function that takes a argument k and returns a + k

    >>> add_three = make_adder(3)
    >>> add_three(4)
    7
    """
    def adder(k):
        return n + k
    return adder