import 'package:airplane/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionSevice {
  final CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      _transactionReference.add({
        'destination': {
          'destination': transaction.destination.toJson(),
          'amountofTraveler': transaction.amountOfTraveler,
          'selectedSeats': transaction.selectedSeat,
          'insurance': transaction.insurance,
          'refundable': transaction.refundable,
          'vat': transaction.vat,
          'price': transaction.price,
          'grandTotal': transaction.grandTotal,
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TransactionModel>> fatchTransactions() async {
    try {
      QuerySnapshot result = await _transactionReference.get();

      List<TransactionModel> transaction = result.docs.map((e) {
        return TransactionModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return transaction;
    } catch (e) {
      rethrow;
    }
  }
}
