def recursion(root, items):
    items += list(root.items.all())
    for child in root.child.all():
        recursion(child, items)
