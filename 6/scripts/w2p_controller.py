# -*- coding: utf-8 -*-
# this file is released under public domain and you can use without limitations

#########################################################################
## This is a sample controller
## - index is the default action of any application
## - user is required for authentication and authorization
## - download is for downloading files uploaded in the db (does streaming)
## - api is an example of Hypermedia API support and access control
#########################################################################

def template():
    return locals()
def template2():
    return locals()


#prettydate function is defined in layout2.html


def callback():
    """an ajax callback that returns a <ul> of links to wiki pages"""
    if len(request.vars.keyword) == 0:
        return ''
    query = db.product_list.product_name.contains(request.vars.keyword)
    pages = db(query).select()
    links = [A(p.product_name, _href=URL('productpage',args=p.id)) for p in pages]
    return UL(*links)






@auth.requires_login()
def index():
    databaserefresh()
    rows = db(db.product_list).select(orderby=~db.product_list.bid_count)
    count=db(db.product_list).count()
    response.flash = 'Hello '+ auth.user.first_name
    return locals()



@auth.requires_login()
def sell():
    
    db.product_list.image_no_2.show_if = (db.product_list.image_no_1!='')
    db.product_list.image_no_3.show_if = (db.product_list.image_no_2!='')
    db.product_list.image_no_4.show_if = (db.product_list.image_no_3!='')
    db.product_list.image_no_5.show_if = (db.product_list.image_no_4!='')
    
    
    
    db.product_list.Devices_Subcategory.show_if = (db.product_list.category=='Devices')
    db.product_list.Mobile_Phones_Subcategory.show_if = (db.product_list.category=='Devices') and (db.product_list.Devices_Subcategory=='Mobile Phones')   #How on earth is this working with an or condition but not with an and condition
    db.product_list.Computers_Subcategory.show_if =  (db.product_list.category=='Devices') and (db.product_list.Devices_Subcategory=='Computers')    #How on earth is this working with an or condition but not with an and condition
    db.product_list.Cameras_Subcategory.show_if =  (db.product_list.category=='Devices') and (db.product_list.Devices_Subcategory=='Cameras')    #How on earth is this working with an or condition but not with an and condition
    
    db.product_list.Books_Subcategory.show_if = (db.product_list.category=='Books')
    db.product_list.end_date_time.writable  = True
    db.product_list.starting_price.writable = True
    
    db.product_list.category.writable = True
    db.product_list.Devices_Subcategory.writable = True
    db.product_list.Mobile_Phones_Subcategory.writable = True
    db.product_list.Computers_Subcategory.writable = True
    db.product_list.Cameras_Subcategory.writable = True
    db.product_list.Books_Subcategory.writable = True
    
    form = SQLFORM(db.product_list).process()
    if form.accepted:
        session.flash = 'Successfully posted product'
        db.product_list.end_date_time.writable = False
        db.product_list.starting_price.writable = False
        
        db.product_list.category.writable = False
        db.product_list.Devices_Subcategory.writable = False
        db.product_list.Mobile_Phones_Subcategory.writable = False
        db.product_list.Computers_Subcategory.writable = False
        db.product_list.Cameras_Subcategory.writable = False
        db.product_list.Books_Subcategory.writable = False
        
        redirect(URL('myuploadeditems'))
    elif form.errors:
        response.flash = 'Form has errors.'
    else:
        response.flash = 'As easy as that !!!'
    return locals()

@auth.requires_login()
def viewposteditems():
    form = SQLFORM(db.product_list).process()
    return locals()


@auth.requires_login()
def manage():
    query = db.product_list.created_by == auth.user
    grid = SQLFORM.grid(query, orderby=db.product_list.end_date_time, create = False, details = False, deletable = False)
    return dict(grid=grid)

@auth.requires_login()
def myuploadeditems():
    rows = db(db.product_list.created_by==auth.user).select()
    rows2 = db(db.records.bidder_id==auth.user.id).select()
    return locals()



@auth.requires_login()
def productpage():
    databaserefresh()
    rows = db(db.product_list).select(orderby=db.product_list.bid_count)
    session.flash = 'Bids once made cannot be withdrawn.'
    arguments = request.args[0]
    product = db(db.product_list.id==request.args[0]).select()
    firstproduct=product[0]
    form2 = SQLFORM.factory(
        Field('bid_value','integer',requires=IS_NOT_EMPTY())
    )
    if form2.process().accepted:
        ret=form2.vars.bid_value
        if firstproduct.current_highest_bidder != 'none' :
            if int(ret) > int(firstproduct.current_highest_bid) :
                db.records.insert(bidder_id=auth.user.id,prod_id=firstproduct.id)
                num_bids = firstproduct.bid_count
                num_bids=num_bids+1
                db(db.product_list.id==request.args[0]).validate_and_update(bid_count=num_bids)
                db(db.product_list.id==request.args[0]).validate_and_update(current_highest_bid=ret)
                ret2=auth.user.id
                db(db.product_list.id==request.args[0]).validate_and_update(current_highest_bidder=ret2)
                redirect(URL('default/productpage',arguments))
            else :
                session.flash = 'Bid amount must be greater than the highest bid.'
        else:
            if int(ret) > int(firstproduct.starting_price) :
                db.records.insert(bidder_id=auth.user.id,prod_id=firstproduct.id)
                num_bids = 0
                num_bids=num_bids+1
                db(db.product_list.id==request.args[0]).validate_and_update(bid_count=num_bids)
                db(db.product_list.id==request.args[0]).validate_and_update(current_highest_bid=ret)
                ret2=auth.user.id
                db(db.product_list.id==request.args[0]).validate_and_update(current_highest_bidder=ret2)
                redirect(URL('default/productpage',arguments))
            else :
                session.flash = 'Bid amount must be greater than the starting price.'
    return locals()





@auth.requires_login()
def querypage():
    length = int(len(request.args))
    if length == 0 :
        rows = db(db.product_list).select()
    if length == 1:
        if request.args[0] == 'Miscellaneous' :
            rows = db(db.product_list.category == 'Miscellaneous').select()
    if length == 3 :
        if request.args[0]=='Devices' :
            if request.args[1]=='Mobile_Phones':
                if request.args[2] == 'Super_Smart_Phone' :
                    rows = db(db.product_list.category == 'Devices' and db.product_list.Devices_Subcategory=='Mobile Phones' and db.product_list.Mobile_Phones_Subcategory=='Super Smart Phone' ).select()
                if request.args[2] == 'Thin_Magic_Mobile' :
                    rows = db(db.product_list.category == 'Devices' and db.product_list.Devices_Subcategory=='Mobile Phones' and db.product_list.Mobile_Phones_Subcategory=='Thin Magic Mobile' ).select()
                if request.args[2] == 'Performance_Crusher' :
                    rows = db(db.product_list.category == 'Devices' and db.product_list.Devices_Subcategory=='Mobile Phones' and db.product_list.Mobile_Phones_Subcategory=='Performance Crusher' ).select()
                if request.args[2] == 'View_All' :
                    rows = db(db.product_list.category == 'Devices' and db.product_list.Devices_Subcategory=='Mobile Phones').select()
    return locals()



@auth.requires_login()
def index2():
    arguments = request.args[0]
    product = db(db.product_list.id==request.args[0]).select()
    firstproduct=product[0]
    form2 = SQLFORM.factory(
        Field('bid_value','integer',requires=IS_NOT_EMPTY())
    )
    if form2.process().accepted:
        ret=form2.vars.bid_value
        if firstproduct.current_highest_bidder != 'none' :
            if int(ret) > int(firstproduct.current_highest_bid) :
                db(db.product_list.id==request.args[0]).validate_and_update(current_highest_bid=ret)
                ret2=auth.user.id
                db(db.product_list.id==request.args[0]).validate_and_update(current_highest_bidder=ret2)
                redirect(URL('default/productpage',arguments))
            else :
                response.flash = 'Bid amount must be greater than the highest bid.'
        else:
            if int(ret) > int(firstproduct.starting_price) :
                db(db.product_list.id==request.args[0]).validate_and_update(current_highest_bid=ret)
                ret2=auth.user.id
                db(db.product_list.id==request.args[0]).validate_and_update(current_highest_bidder=ret2)
                redirect(URL('default/productpage',arguments))
            else :
                response.flash = 'Bid amount must be greater than the starting price.'
    return locals()




def databaserefresh():
    rows = db(db.product_list.status == 'Live').select(orderby=~db.product_list.bid_count)
    for row in rows :
        if row.end_date_time < request.now :
            db(db.product_list.id==row.id).update(status='Expired')
            if row.current_highest_bidder != 'none' :
                rec_email = db(db.auth_user.id == row.current_highest_bidder).select()[0]
                mail.send(to=[rec_email.email],subject='Successfully acquired product.',message='Congratulations '+rec_email.first_name+' '+rec_email.last_name+', you have won the bidding for '+row.product_name+'. You may now contact the seller at his email address.')
            db.commit()
    return 1






def user():
    """
    exposes:
    http://..../[app]/default/user/login
    http://..../[app]/default/user/logout
    http://..../[app]/default/user/register
    http://..../[app]/default/user/profile
    http://..../[app]/default/user/retrieve_password
    http://..../[app]/default/user/change_password
    http://..../[app]/default/user/manage_users (requires membership in
    use @auth.requires_login()
        @auth.requires_membership('group name')
        @auth.requires_permission('read','table name',record_id)
    to decorate functions that need access control
    """
    return dict(form=auth())


@cache.action()
def download():
    """
    allows downloading of uploaded files
    http://..../[app]/default/download/[filename]
    """
    return response.download(request, db)


def call():
    """
    exposes services. for example:
    http://..../[app]/default/call/jsonrpc
    decorate with @services.jsonrpc the functions to expose
    supports xml, json, xmlrpc, jsonrpc, amfrpc, rss, csv
    """
    return service()


@auth.requires_login() 
def api():
    """
    this is example of API with access control
    WEB2PY provides Hypermedia API (Collection+JSON) Experimental
    """
    from gluon.contrib.hypermedia import Collection
    rules = {
        '<tablename>': {'GET':{},'POST':{},'PUT':{},'DELETE':{}},
        }
    return Collection(db).process(request,response,rules)
