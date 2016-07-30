

def callback():
    """an ajax callback that returns a <ul> of links to wiki pages"""
    if len(request.vars.keyword) == 0:
        return ''
    query = db.product_list.product_name.contains(request.vars.keyword)
    pages = db(query).select()
    links = [A(p.product_name, _href=URL('productpage',args=p.id)) for p in pages]
    return UL(*links)

