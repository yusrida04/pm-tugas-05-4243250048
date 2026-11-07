import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pm_pertemuan_05/main.dart';

void main() {
  testWidgets('Ikon favorit berubah ketika ditekan', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: TombolFavorit(namaMenu: 'Soto Medan')),
      ),
    );

    expect(find.byIcon(Icons.favorite_border), findsOneWidget);

    await tester.tap(find.byKey(const Key('tombol_favorit')));
    await tester.pump();

    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border), findsNothing);

    expect(find.text('Soto Medan ditambahkan ke favorit!'), findsOneWidget);
  });
}
