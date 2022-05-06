def recursion(root, items):
    items += list(root.items.all())
    print(root)
    for child in root.child.all():
        recursion(child, items)
