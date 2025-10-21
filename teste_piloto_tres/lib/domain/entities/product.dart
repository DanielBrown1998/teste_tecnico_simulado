// Model
class Product {
  final String id;
  final String name;
  final double price;
  int quantity; // Este campo será gerenciado pelo estado

  Product({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1, // Todos começam com 1 unidade
  });
}
