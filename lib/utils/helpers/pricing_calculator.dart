class VPricingCalculator {

  /// -- Calculate Price based on tax and shipping
  static double calculateTotalPrice(double productPrice, String location) {
  double taxRate = getTaxRateForLocation(location);
  double taxAmount = productPrice * taxRate;

  double shippingCost = getShippingCost(location);

  double totalPrice = productPrice + taxAmount + shippingCost;
  return double.parse(totalPrice.toStringAsFixed(2));
  }

  /// -- Calculate shipping cost
  static String calculateShippingCost(double productPrice, String location) {
  double shippingCost = getShippingCost(location);
  return shippingCost.toStringAsFixed(2);
  }
  /// -- Calculate tax
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
  return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
  return 0.10; // Example tax rate of 10%
  }

  static double getShippingCost(String location) {
  return 5.00; // Example shipping cost of $5
  }
}