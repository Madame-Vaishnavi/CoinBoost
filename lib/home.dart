import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState(){
    super.initState();
    initBannerAd();
  }

  late BannerAd bannerAd;
  bool isAdLoaded = false;

  initBannerAd() {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: "ca-app-pub-3940256099942544/6300978111",
        listener: BannerAdListener(onAdLoaded: (ad) {
          setState(() {
            isAdLoaded = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print(error);
        }),
        request: AdRequest());
    bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(
                      image: AssetImage("assets/profile.png"),
                      width: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "John Doe",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image(
                      image: AssetImage("assets/star-medal 1.png"),
                      width: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Level 01",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image(
                      image: AssetImage("assets/wallet 1.png"),
                      width: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "\$25.04",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Claim your Daily Reward",
              style: TextStyle(
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isAdLoaded
                    ? SizedBox(
                        width: bannerAd.size.width.toDouble()*0.85,
                        height: bannerAd.size.height.toDouble(),
                        child: AdWidget(ad: bannerAd),
                      )
                    : SizedBox()
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text(
                  "Do Tasks, Earn Rewards",
                  style: TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
                  child: Text(
                    "You can do these tasks as many times as you want to",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Container(
              width: 300,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage("assets/game.png"),
                  fit: BoxFit
                      .cover, // Ensures the image covers the entire container
                ),
              ),
              clipBehavior: Clip.hardEdge,
              child: Column(
                children: [
                  Container(
                    height: 120,
                  ),
                  Container(
                    height: 30,
                    color: Colors.white.withOpacity(0.75),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Play Game",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "\$10",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ), // Ensures the image gets clipped to the borderRadius
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/news");
              },
              child: Container(
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage("assets/news.png"),
                    fit: BoxFit
                        .cover, // Ensures the image covers the entire container
                  ),
                ),
                clipBehavior: Clip.hardEdge,
                child: Column(
                  children: [
                    Container(
                      height: 120,
                    ),
                    Container(
                      height: 30,
                      color: Colors.white.withOpacity(0.75),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Read News",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "\$5",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ), // Ensures the image gets clipped to the borderRadius
              ),
            ),
          ],
        ),
      ),
    );
  }
}
