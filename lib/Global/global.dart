import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class GlobalVar {
  static List imgList = [
    {
      'id': 1,
      "image_path":
          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    },
    {
      'id': 2,
      "image_path":
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    },
    {
      'id': 3,
      "image_path":
          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    },
    {
      'id': 4,
      "image_path":
          'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    },
    {
      'id': 5,
      "image_path":
          'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    },
    {
      'id': 6,
      "image_path":
          'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    }
  ];

  static List productImage = [
    'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
    'https://media.istockphoto.com/id/452470765/photo/3d-red-knitted-winter-cap-on-white-background.jpg?s=612x612&w=0&k=20&c=96ZQ2VReqIcw6wiBVFd2kvVxDkhUoX5DPvopv8wAh6M=',
    'https://static.zara.net/photos///2023/V/0/2/p/0632/302/737/2/w/824/0632302737_6_2_1.jpg?ts=1673425662218',
    'https://queerintheworldshop.com/cdn/shop/products/classic-dad-hat-pink-left-front-62a9b52ad718a_1024x1024.jpg?v=1655289158',
    'https://media.gq.com/photos/63405112e3db2e41ce8ba53f/master/w_1280%2Cc_limit/Layer_1.jpg',
    'https://img.joomcdn.net/27e99929b94930b2fc346f0d650e9442827ca094_original.jpeg',
    'https://cdn.shopify.com/s/files/1/0053/5615/9064/products/Classic_Organic_Hood-Hoodie-CS1006-Steel_Blue_6c3d3049-92d7-41e0-87bf-70b5d2007c6f_400x.jpg?v=1639447866',
    'https://cdn.shopify.com/s/files/1/0568/4707/3431/products/IMG_20210607_170558_ff9a70c4-f321-4107-bbcc-5090b9c509c9.jpg?v=1624516930',
    'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
  ];

  static List<Color> listColor = [
    Colors.black,
    Colors.red,
    Colors.pink,
    Colors.red,
    Colors.red,
    Colors.pink,
    Colors.red,
  ];

  static bool isClick = true;
  static bool isApply = true;

  static bool itemAdded = true;

  static String? clickedId;
  static int currentIndex = 0;
  static final CarouselController carouselController = CarouselController();
  static int selectedSizeIndex = 0;
  static int selectedColorIndex = 0;
}
