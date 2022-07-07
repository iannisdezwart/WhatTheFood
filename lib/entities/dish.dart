class Dish
{
	final String name;
	final String imageFilePath;
	final num rating;
	num? yourRating;

	Dish({
		required this.name,
		required this.imageFilePath,
		required this.rating,
		required this.yourRating,
	});

	factory Dish.fromJson(Map<String, dynamic> json)
	{
		return Dish(
			name: json['name'] as String,
			imageFilePath: json['imageFilePath'] as String,
			rating: json['rating'] as num,
			yourRating: json['yourRating'] as num?,
		);
	}
}

class NewDish
{
	final String name;
	final String image;

	NewDish({ required this.name, required this.image });

	factory NewDish.fromJson(Map<String, dynamic> json)
	{
		return NewDish(
			name: json['name'],
			image: json['image'],
		);
	}

	Map<String, dynamic>
	toJSON() => {
		'name': name,
		'image': image,
	};
}