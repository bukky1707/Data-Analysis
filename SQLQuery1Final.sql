CREATE DATABASE BADE
USE BADE

CREATE TABLE Item
(
ItemID		int not null Identity(10,1),
Quantity	int	not null,
Name		varchar(30)	not null,
Description	varchar(120),
BiddingStartTime	date,
InitialPrice	Real not null,
EndTime		date,
Condition	varchar(25) 
			Check (Condition IN ('Refurbished','New', 'explained')),
Date		date not null default GetDate(),
Primary Key(ItemID)
)
Alter Table Item
Add OwnerName varchar(100)

select * from Item

Update Item
Set OwnerName = 'Sierra Mars'
where ItemID = 10

Update Item
Set OwnerName = 'Sierra Mars'
where ItemID = 14

Update Item
Set OwnerName = 'Steve Martin'
where ItemID = 12

Update Item
Set OwnerName = 'Lincoln Park'
where ItemID = 13

Update Item
Set EndTime = '10/10/22'
where ItemID = 15

Update Item
Set EndTime = '10/10/22'
where ItemID = 10
Insert into Item(Quantity, Name, Description, BiddingStartTime, InitialPrice, EndTime, Condition, Date)
values(10,'Ivory','Hard, white material from the tusks and teeth of animals','3/10/20',40000,'9/10/20','New','10/10/20')
Insert into Item(Quantity, Name, Description, BiddingStartTime, InitialPrice, EndTime, Condition, Date)
values(5,'Travel package','All inclusive travelling package deal for two','3/10/20',5000,'10/10/20','New','10/10/20')
Insert into Item(Quantity, Name, Description, BiddingStartTime, InitialPrice, EndTime, Condition, Date)
values(15,'Braves game tickets','Exclusive Box seats to the Atlanta Braves game','3/10/20',1500,'11/10/20','Explained','12/10/20')
Insert into Item(Quantity, Name, Description, BiddingStartTime, InitialPrice, EndTime, Condition, Date)
values(2,'Artwork','Art created by a rising Atlanta artist','3/10/20',20000,'8/10/20','Refurbished','9/10/20')
Insert into Item(Quantity, Name, Description, BiddingStartTime, InitialPrice, EndTime, Condition, Date)
values(10,'Concert Tickets','Exclusive VIP tickets to Harry Styles concert','3/10/20',600,'8/10/20','Explained','9/10/20')
Insert into Item(Quantity, Name, Description, BiddingStartTime, InitialPrice, Condition, Date)
values(10,'Old stamps','Exclusive VIP tickets to Harry Styles concert','3/10/20',300,'Explained','9/10/22')
Insert into Item(Quantity, Name, Description, BiddingStartTime, InitialPrice, EndTime, Condition, Date)
values(1,'Yatcht','Big, 3-bedroom yatcht','3/10/20',200000,'11/11/22','New','9/10/22')


CREATE TABLE Seller
(
SellerID	int not null Identity(100,1),
FName		varchar(30)	not null,
LName		varchar(30) not null,
OwnerName	varchar(70),
CardNo		varchar(20),
ExpirationDate	date default GetDate(),
Phone#		varchar(12) not null unique,
Email		varchar(40) not null unique,
Street#		varchar(4),
StreetName		varchar(50),
City		varchar(40),
State		char(2),
Zipcode		char(10),
Primary Key(SellerID)
)
Insert into Seller values('Sierra','Mars','Sierra Mars-Ri','1234567892137213','01/02/24','4045762990','smars2@gmail.com','1234','Ozumba Mbadiwe',
'Kennesaw','GA','30144')
Insert into Seller values('Mary','Jackson','Mary Jackson','5678234510903421','02/02/24','4044319990','mjackson@gmail.com','5680',
'South West','Marietta','GA','30060')
Insert into Seller values('John','Mikel','John Mikel','9121567892137213','04/02/25','4045765560','jmikel@gmail.com','4521','Johns Creek',
'Jonesboro','GA','30180')
Insert into Seller values('Steve','Martin','Steve Martin','1234567894451277','05/10/24','4044452990','smartin5@gmail.com','2113','West Handon',
'Kennesaw','GA','30144')
Insert into Seller values('Lincoln','Park','Lincoln Park','1234567222137213','10/10/22','4045762921','lpark10@gmail.com','7821','South Park',
'Marietta','GA','30060')
Create Table ItemOwner
(
SellerID	int not null,
ItemID		int not null,

Primary Key(SellerID, ItemID),
Foreign Key(SellerID) references Seller(SellerID),
Foreign Key(ItemID) references Item(ItemID),
)
Insert into ItemOwner values(100,10)
Insert into ItemOwner values(101,11)
Insert into ItemOwner values(100,14)
Insert into ItemOwner values(102,12)
Insert into ItemOwner values(104,13)
select * from ItemOwner
CREATE TABLE Buyer
(
UserName	int not null Identity(100,1),
FName		varchar(30)	not null,
LName		varchar(30) not null,
Password	varchar(20) not null unique,
OwnerName	varchar(70),
CardNo		varchar(20),
ExpirationDate	date default GetDate(),
Phone#		varchar(12) not null unique,
Email		varchar(40) not null unique,
Street#		varchar(4),
StreetName		varchar(50),
City		varchar(40),
State		char(2),
Zipcode		char(10),
Primary Key(UserName)
)
Insert into Buyer values('Jason','Mar','marjason56','Jason Mar','1234567892137211','01/02/24','4045762990','jmar56@gmail.com','1234','Smith Road',
'Kennesaw','GA','30144')
Insert into Buyer values('James','Car','carames31','James Car','1238167892137211','03/02/24','4705762990','jcar3@gmail.com','1901','Sandy Road',
'Marietta','GA','30060')
Insert into Buyer values('Martha','Swain','mswain12','Martha Swain','5275167892137211','05/02/24','4700062990','mswain@gmail.com','1000','Sandy Plain',
'Kennesaw','GA','30144')
Insert into Buyer values('Steph','Creaha','creapha9','Steph Creaha','8538167892137211','10/02/24','6785762990','crepha@gmail.com','2001','Winsley Road',
'Marietta','GA','30060')
Insert into Buyer values('Pistis','Rose','pistose18','Pistis Rose','9781167892137211','04/02/25','4045762981','prose@gmail.com','4901','Witty Road',
'Kennesaw','GA','30144')
Create Table Auction
(
AuctionID	int not null Primary Key
)
insert into Auction values(100)
insert into Auction values(150)
insert into Auction values(200)
insert into Auction values(850)
insert into Auction values(430)

Create Table Website
(
ItemDetailPage	int not null,
ItemID		int not null,

Foreign Key(ItemID) references Item(ItemID)
)

Insert into Website values(1 , 10)
Insert into Website values(1, 11)
Insert into Website values(3, 12)
Insert into Website values(3, 14)
Insert into Website values(1, 13)
Create Table Picture
(
PictureID	int not null Primary Key,
ItemID		int not null,

Foreign Key(ItemID) references Item(ItemID)
)
Insert into Picture values(10, 14)
Insert into Picture values(20,12)
Insert into Picture values(30,11)
Insert into Picture values(40,10)
Insert into Picture values(50,13)
Create Table Bid
(
BidNo	int not null Identity(5,5) Primary Key,
Amount	money,
Winner	varchar(100),
)
Insert into Bid values(50000,'Martha Swain')
Insert into Bid values(7000,'Jason Mar')
Insert into Bid values(2000,'James Car')
Insert into Bid values(900,'Pistis Rose')
Insert into Bid values(25000,'Steph Creaha')
Create Table BuyerBid
(
BidNo	int not null,
ItemID	int not null,
UserName int not null,
Biddate	date default Getdate(),
Price	Real not null,

Primary Key (BidNo, ItemID, UserName),
Foreign Key(BidNo) references Bid(BidNo),
Foreign Key(ItemID) references Item(ItemID),
Foreign Key(UserName) references Buyer(UserName),
)
select * from BuyerBid
Insert into BuyerBid values(5,10,101,'10/10/2020',50000)
Insert into BuyerBid values(10,12,100,'10/10/2020',20000)
Insert into BuyerBid values(25,14,104,'10/10/2020',900)
Insert into BuyerBid values(20,13,103,'10/10/2020',2000)
Insert into BuyerBid values(25,11,100,'10/10/2020',7000)

--The most active Seller 
--Report 1 
Create View NoOfItems AS
Select OwnerName, Count(OwnerName) AS [Number of Items]
from  Item
Group by (OwnerName)

Select Top 1 OwnerName, [Number of Items] AS [Highest # of Item]
from NoOfItems
Order by [Number of Items] desc

--The most active buyer
Select Top 1 Buyer.UserName, Buyer.FName, Buyer.LName, Count(BuyerBid.ItemID) AS [Number of Items]
from Buyer Join BuyerBid
on BuyerBid.UserName = Buyer.UserName
Group by Buyer.UserName, Buyer.FName, Buyer.LName

--The most expensive item sold ever
Select Bid.BidNo, Item.ItemID, Item.Name,(Bid.Amount)
from BuyerBid 
Join Item ON 
BuyerBid.ItemID = Item.ItemID
Join Bid on
BuyerBid.BidNo = Bid.BidNo
where Bid.Amount In (Select MAX(Bid.Amount) from Bid)

--The cheapest item sold
Select Bid.BidNo, Item.ItemID, Item.Name,(Bid.Amount)
from BuyerBid 
Join Item ON 
BuyerBid.ItemID = Item.ItemID
Join Bid on
BuyerBid.BidNo = Bid.BidNo
where Bid.Amount In (Select MIN(Bid.Amount) from Bid)

select * from Item
--The cheapest item available
Select  ItemID, Name,(InitialPrice) AS [Cheapest Available Item Price]
from Item
where InitialPrice In (Select MIN(InitialPrice) from Item)
and EndTime > GETDATE()

--The most expensive item available
Select ItemID, Name, (InitialPrice) AS [Most Expensive Available Item Price]
from Item
where InitialPrice In (Select MAX(InitialPrice) from Item)
and EndTime > GETDATE()

