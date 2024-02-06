def dfs(x):
    while True:
        l = list()
        for i in x:
            if isinstance(i, list):
                l.extend(i)
            else:
                l.append(i)
        x = l.copy()
