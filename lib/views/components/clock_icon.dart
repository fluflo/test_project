import 'package:flutter/material.dart';
import 'package:path_icon/path_icon.dart';

class ClockIcon extends StatelessWidget {
const ClockIcon({ Key? key }) : super(key: key);
  final String clockSvg = '''
<svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
<line x1="13.4512" y1="4.00879" x2="13.4512" y2="6.13867" stroke="black" stroke-linecap="round"/>
<line x1="6.35596" y1="4.00879" x2="6.35596" y2="6.13861" stroke="black" stroke-linecap="round"/>
<line x1="3.41211" y1="7.82999" x2="16.0967" y2="7.82999" stroke="black"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M14.737 5.8944C15.1175 6.03585 15.3886 6.40228 15.3886 6.83203V14.8371C15.3886 15.3894 14.9409 15.8371 14.3886 15.8371H5.39746C4.84518 15.8371 4.39746 15.3894 4.39746 14.8371V6.83203C4.39746 6.39215 4.68148 6.0186 5.07615 5.88477L5.07614 4.85771C4.12433 5.01142 3.39746 5.83684 3.39746 6.83203V14.8371C3.39746 15.9417 4.29289 16.8371 5.39746 16.8371H14.3886C15.4932 16.8371 16.3886 15.9417 16.3886 14.8371V6.83203C16.3886 5.84631 15.6755 5.02714 14.737 4.86227L14.737 5.8944ZM13.937 5.83203L13.937 4.83203H5.87614L5.87615 5.83203H13.937Z" fill="black"/>
</svg>
''';
  @override
  Widget build(BuildContext context){
    return PathIcon(PathIconData.fromSvg(clockSvg));
  }
}