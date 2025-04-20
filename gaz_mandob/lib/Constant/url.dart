class AppApi {
  static String url = "https://mayadeen-md.com/gaz/public/api";
  static String IMAGEURL = 'https://mayadeen-md.com/gaz/public/storage/';
  static String LOGIN = '/login';
  static String Signup = '/register';
  static String GetMyOrders = '/get-my-orders-as-mandob';
  static String GetMyCancelOrders = '/get-my-cancel-orders';
  static String ChangeMyStatus = '/change-my-status';
  static String GetOrderById(int id) => '/get-order-by-id/$id';
  static String GetDailyOrdersMandob = '/get-daily-orders-mandob';

  static String ReciveInvoicefromSupplier(int invoice_id) =>
      '/get-order-status/$invoice_id';
  static String AcceptOrder(int id) => '/accept-order/$id';
  static String ReciveOrderAsUser(int id) => '/recieve-order-as-user/$id';
  static String CancelOrder(int id) => '/cancel-order/$id';

  static String WalletTransaction = '/wallet-transactions';
  static String GetProfile = '/profile';
  static String UpdateProfile = '/update-profile';
  static String GetInfo = '/get-info';
  static String SendContact = '/send-contact';
  static String GetNoti = '/get-noti';
  static String Report = '/report';
  static String Rate = '/rate';
  static String GetTickets = '/get-tickets';
  static String GetMyTickets(int id) => '/get-my-ticket/$id';
  static String PostTicket(int id) => '/post-ticket/$id';
  static String SendMessage(int id) => '/send-message/$id';
  static String GetAllRegions = '/get-all-regions';
  static String GetAllCities(int id) => '/get-all-cities/$id';
  static String GetAllDistricts(int id) => '/get-all-districts/$id';
  static String GetCountry = '/get-countries';

  static String UpdateLocation = '/update-location';
  static String GetStatus = '/get-status';
}
