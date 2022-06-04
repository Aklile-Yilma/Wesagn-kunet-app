import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        Text(
          "Dashboard",
          style: Theme.of(context).textTheme.headline6,
        ),
        Expanded(child: SearchField()),
        ProfileCard(),
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,

      // margin: EdgeInsets.only(left: 16),
      padding: EdgeInsets.symmetric(
        horizontal: 2,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF2A2D3E),
        borderRadius: const BorderRadius.all(Radius.circular(2)),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.account_box,
            size: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: Text("Admin1"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Log Out",
              style: TextStyle(fontSize: 8),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: Color(0xFF2A2D3E),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(3)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Color(0xFF2697FF),
              borderRadius: const BorderRadius.all(Radius.circular(2)),
            ),
            child: Icon(Icons.search),
            height: 6,
            width: 6,
          ),
        ),
      ),
    );
  }
}
