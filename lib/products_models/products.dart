class ProductInfo {
  final int id;
  final String category;
  final String model;
  final List<int> memory;
  final String description;
  final String image;
  final double price;
  final String? color;
  final int counts;
  final String rating;
  int? number;

  ProductInfo({
    required this.id,
    required this.category,
    required this.model,
    required this.memory,
    required this.description,
    required this.image,
    required this.price,
    this.color,
    this.number,
    required this.counts,
    required this.rating,
  });
}

List<ProductInfo> shopProducts = [
  ProductInfo(
    id: 1,
    number: 1,
    category: 'ноутбуки',
    model: 'MacBook Air',
    memory: [256, 512, 1024],
    description:
        'MacBook Air sails through work and play — and the M3 chip brings even greater capabilities to the world’s most popular laptop. With up to 18 hours of battery life,1 you can take the superportable MacBook Air anywhere and blaze through whatever you’re into.',
    image: 'assets/computers/macbook13m2.png',
    price: 999,
    counts: 43,
    rating: '4.9',
  ),
  ProductInfo(
    id: 2,
    number: 1,
    category: 'ноутбуки',
    model: 'MacBook Pro',
    memory: [512, 1024, 2048],
    description:
        'MacBook Pro blasts forward with the M3, M3 Pro, and M3 Max chips. Built on 3‑nanometer technology and featuring an all-new GPU architecture, they’re the most advanced chips ever built for a personal computer. And each one brings more pro performance and capability.',
    image: 'assets/computers/macbook14.png',
    price: 1599,
    counts: 68,
    rating: '4.8',
  ),
  ProductInfo(
    id: 3,
    number: 1,
    category: 'компьютеры',
    model: 'iMac',
    memory: [512, 1024, 2048],
    description:
        'The world’s best all‑in‑one computer, now supercharged by the M3 chip. With a stunning 24‑inch display1 that gives you all the space you need and an iconic design that livens up any space, iMac is perfect for work and play.',
    image: 'assets/computers/imac24.png',
    price: 1299,
    counts: 24,
    rating: '4.9',
  ),
  ProductInfo(
    id: 4,
    number: 1,
    category: 'компьютеры',
    model: 'Mac mini',
    memory: [256, 512, 1024, 2048],
    description:
        'Mac mini with M2 packs the speed you need to get more done faster. And M2 Pro takes it to a whole new level — bringing a pro chip to Mac mini for the first time. Add to that a versatile array of ports and you’ve got a desktop ready to flex in any setup, no matter which chip you choose.',
    image: 'assets/computers/mac-mini.png',
    price: 599,
    counts: 434,
    rating: '4.7',
  ),
  ProductInfo(
    id: 5,
    number: 1,
    category: 'компьютеры',
    model: 'Mac Studio',
    memory: [512, 1024, 2048],
    description:
        'Embraced by creative pros everywhere, Mac Studio now delivers next-generation power in the form of the lightning-fast M2 Max and the boundary-breaking M2 Ultra. It packs outrageous performance and extensive connectivity in an unbelievably compact form, putting everything you need within easy reach and transforming any space into a studio.',
    image: 'assets/computers/mac-studio.png',
    price: 1999,
    counts: 32,
    rating: '5.0',
  ),
  ProductInfo(
    id: 6,
    number: 1,
    category: 'мониторы',
    model: 'Studio Display',
    memory: [],
    description:
        'A big, beautiful window into new worlds, Studio Display draws you in from the moment you turn it on. It has a slim, all-screen design. And it’s packed with a phenomenal set of features so everything you do springs to life with gorgeous color and spectacular detail.',
    image: 'assets/computers/studio-display.png',
    price: 1599,
    counts: 12,
    rating: '5.0',
    color: 'midnight blue',
  ),
  ProductInfo(
    id: 7,
    number: 1,
    category: 'компьютеры',
    model: 'Mac Pro',
    memory: [1024, 2048, 4096, 8192],
    description:
        'Mind-blowing performance now comes standard. The new Mac Pro is a game-changing combination of Apple silicon performance and PCIe expansion for specialized workflows. And every configuration comes with the incredible new M2 Ultra — our most powerful and capable chip ever.',
    image: 'assets/computers/mac-pro.png',
    price: 6999,
    counts: 132,
    rating: '4.7',
  ),
  ProductInfo(
      id: 8,
      number: 1,
      category: 'мониторы',
      model: 'Pro Display',
      memory: [],
      description:
          'The first 32-inch Retina 6K display ever. Up to 1600 nits of brightness. An astonishing 1,000,000:1 contrast ratio and superwide viewing angle. Over a billion colors presented with exceptional accuracy. And dynamic range that transforms the professional workflow. Introducing Apple Pro Display XDR, the world’s best pro display.',
      image: 'assets/computers/proxdr.png',
      price: 4999,
      counts: 42,
      rating: '4.9',
      color: 'space grey'),
  ProductInfo(
    id: 9,
    number: 1,
    category: 'смартфоны',
    model: 'iPhone 15 pro',
    memory: [256, 512, 1024],
    description:
        'iPhone 15 Pro is the first iPhone to feature an aerospace‑grade titanium design, using the same alloy that spacecraft use for missions to Mars. Titanium has one of the best strength‑to‑weight ratios of any metal, making these our lightest Pro models ever. You`ll notice the difference the moment you pick one up.',
    image: 'assets/iphones/iphone15pro.png',
    price: 999,
    counts: 543,
    rating: '5.0',
  ),
  ProductInfo(
    id: 10,
    number: 1,
    category: 'смартфоны',
    model: 'iPhone 15',
    memory: [128, 256, 512, 1024],
    description:
        'iPhone 15 is the first iPhone to feature an aerospace‑grade titanium design, using the same alloy that spacecraft use for missions to Mars. Titanium has one of the best strength‑to‑weight ratios of any metal, making these our lightest Pro models ever. You`ll notice the difference the moment you pick one up.',
    image: 'assets/iphones/iphone15.png',
    price: 799,
    counts: 433,
    rating: '5.0',
  ),
  ProductInfo(
    id: 11,
    number: 1,
    category: 'смартфоны',
    model: 'Galaxy S24 Ultra',
    memory: [128, 256, 512, 1024],
    description:
        'Galaxy S24 Ultra с инновационной 200 МП камерой и встроенным искусственным интеллектом устанавливает новый стандарт качества съемки. Новый алгоритм ProVisual распознает объекты, улучшает цветовой тон, уменьшая шум и подчеркивая детали. Наслаждайтесь каждым снимком, снятым на Galaxy S24 Ultra.',
    image: 'assets/samsungPhones/s24ultra.png',
    price: 1099,
    counts: 535,
    rating: '4.9',
  ),
];

List<List<dynamic>> favouritesProdusts = [];
