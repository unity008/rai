import 'package:RAI/src/models/bank.dart';
import 'package:RAI/src/models/default_bank.dart';
import 'package:RAI/src/models/deposit_match.dart';
import 'package:RAI/src/models/history.dart';
import 'package:RAI/src/models/notification.dart';
import 'package:RAI/src/models/oAuth.dart';
import 'package:RAI/src/models/savings.dart';
import 'package:RAI/src/models/user.dart';
import 'package:RAI/src/providers/auth.dart';
import 'package:RAI/src/providers/deposit.dart';
import 'package:RAI/src/providers/user.dart';
import 'package:dio/dio.dart';

class Repository {
  // Auth Provider
  final authProvider = new AuthProvider();
  Future<OAuth> doLogin(String code) => authProvider.doLogin(code);

  // User Provider
  final userProvider = new UserProvider();
  getKYC() => userProvider.getKYC();
  Future setDefaultAccountBank(int id) => userProvider.setDefaultAccountBank(id);
  Future<User> getUser() => userProvider.getUser();
  Future<DefaultBank> getDefaultBank() => userProvider.getDefaultBank();
  Future<List<Bank>> getBankList(CancelToken token) => userProvider.getBankList(token);
  Future<List<History>> getHistory() => userProvider.getHistory();
  Future purchaseDeposit(num amount, int bankAccId, String productId) => userProvider.purchaseDeposit(amount, bankAccId, productId);
  Future<List<Savings>> getSavingList() => userProvider.getSavingList();
  Future cancelSwitchOut(String requestId) => userProvider.cancelSwitchOut(requestId);
  Future sendMatchOrder(String termDepositId, num quantity) => userProvider.sendMatchOrder(termDepositId, quantity);
  Future setToken(String token) => userProvider.setToken(token);
  Future<List<Notifications>> fetchNotification(CancelToken token) => userProvider.fetchNotification(token);

  // Deposit Provider
  final depositProvider = new DepositProvider();
  Future<List<DepositMatch>> getDepositMatch(num amount, int limit, String startDate, String endDate) => depositProvider.getDepositMatch(amount, limit, startDate, endDate);

} 
final repo = new Repository();