using { sap.capire.bookshop as my } from '../db/bookstore';

service BookService @(path:'/browse') {

  entity Books as SELECT from my.Books { * } excluding { createdBy, modifiedBy };

  entity Orders as projection on my.Orders;
  entity OrderItems as projection on my.OrderItems;

  action addRandomBook ( action: Integer) returns array of Books;

  view testvw as
  select A.ID,  B.amount
  from my.Orders A inner join my.OrderItems B
  on A.ID = B.orderID
  ;

  view testvw2(orderNo: String) as
  select A.ID,  B.amount
  from my.Orders A inner join my.OrderItems B
  on A.ID = B.orderID
  ;

  entity BooksVW as projection on my.BOOKSVW;

}