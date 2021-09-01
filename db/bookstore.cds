namespace sap.capire.bookshop;

using
{
    Currency,
    managed
}
from '@sap/cds/common';

entity Books : managed
{
    key ID : Integer;
    title : localized String(111);
    descr : localized String(1111);
    authorID : Integer;
    stock : Integer;
    price : Decimal(9,2);
    currency : Currency;
}

entity Authors : managed
{
    key ID : Integer;
    name : String(111);
    books : Association to many Books on books.authorID = ID;
}

entity Orders : managed
{
    key ID : Integer;
    OrderNo : String
        @title : 'Order Number';
    Items : Composition of many OrderItems on Items.orderID = ID;
}

entity OrderItems
{
    key ID : Integer;
    orderID : Integer;
    bookID : Integer;
    parent : Association to one Orders on parent.ID = orderID;
    book : Association to one Books on book.ID = bookID;
    amount : Integer;
}

@cds.persistence.exists
entity BOOKSVW {
  key ID : Integer64;
  title : String(111);
  descr : String(1111);
}