def dfs(x):
    while True:
        l = list()
        for i in x:
            if isinstance(i, list):
                l.extend(i)
            else:
                l.append(i)
        x = l.copy()
        del l
        if all([False if isinstance(i, list) else True for i in x]):
            break
    print(x)


dfs(["a", [], 8, [2.1, ["xx", 1]], [[[None]]]])
