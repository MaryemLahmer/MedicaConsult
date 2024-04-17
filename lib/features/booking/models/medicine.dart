class Medicine {
  int _medicineId;
  String _medicineImage;
  String _name;
  String _description;
  int _remainingItems;
  int _quantity;
  double _price;
  double _salePercentage;

  Medicine({
    required int medicineId,
    required String medicineImage,
    required String name,
    required String description,
    required int remainingItems,
    required int quantity,
    required double price,
    required double salePercentage,
  })  : _medicineId = medicineId,
        _medicineImage = medicineImage,
        _name = name,
        _description = description,
        _remainingItems = remainingItems,
        _quantity = quantity,
        _price = price,
        _salePercentage = salePercentage;

  int get getMedicineId => _medicineId;
  set setMedicineId(int value) {
    _medicineId = value;
  }

  String get getMedicineImage => _medicineImage;
  set setMedicineImage(String value) {
    _medicineImage = value;
  }

  String get getName => _name;
  set setName(String value) {
    _name = value;
  }

  String get getDescription => _description;
  set setDescription(String value) {
    _description = value;
  }

  int get getRemainingItems => _remainingItems;
  set setRemainingItems(int value) {
    _remainingItems = value;
  }

  int get getQuantity => _quantity;
  set setQuantity(int value) {
    _quantity = value;
  }

  double get getPrice => _price;
  set setPrice(double value) {
    _price = value;
  }

  double get getSalePercentage => _salePercentage;
  set setSalePercentage(double value) {
    _salePercentage = value;
  }
}
