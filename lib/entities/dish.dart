class Dish
{
	final String name;
	final String imageFilePath;
	final List<dynamic> description;
	num rating;
	num? yourRating;

	Dish({
		required this.name,
		required this.imageFilePath,
		required this.description,
		required this.rating,
		required this.yourRating,
	});

	factory Dish.fromJson(Map<String, dynamic> json)
	{
		return Dish(
			name: json['name'] as String,
			imageFilePath: json['imageFilePath'] as String,
			description: json['description'] as List<dynamic>,
			rating: json['rating'] as num,
			yourRating: json['yourRating'] as num?,
		);
	}
}

class NewDish
{
	final String name;
	final String image;
	final List<dynamic> description;

	NewDish({ required this.name, required this.image, required this.description });

	factory NewDish.fromJson(Map<String, dynamic> json)
	{
		return NewDish(
			name: json['name'],
			image: json['image'],
			description: json['description'],
		);
	}

	Map<String, dynamic>
	toJSON() => {
		'name': name,
		'image': image,
		'description': description,
	};
}