import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web/screens/pages/shortlink/database/model/linksmodel.dart';

class FirstAdspage extends StatelessWidget {
  const FirstAdspage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( 
        child: Column(
          children: [
            Center(
              child: Container(
                width: Get.mediaQuery.devicePixelRatio * 600,
                constraints:const BoxConstraints(maxHeight: double.infinity),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(TextData().data),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
              onPressed: () async {
                final link = await Hive.openBox<LinkModel>('linkdb');
                var string = Get.parameters['string'];
                var value = link.get(string);
                var longlinks = value?.longlink;
                if (longlinks != null){
                final Uri url = Uri.parse(longlinks);
                await launchUrl(url);
                } else {
                  Get.toNamed('/');
                }
              },
              child: const Text('Get Link'),
                      ),
            )
          ],
        ),
      ),
    );
  }
}


class TextData {
  String data = """Introduction:
Charles Baudelaire's poem "To the Reader" delves into the intricate relationship between the reader, the author, and the act of reading itself. Through the use of metaphor and powerful imagery, Baudelaire explores the notion that reading is not a passive act but rather a collaborative effort between the author and the reader. This essay aims to critically analyze Baudelaire's poem, unraveling its underlying themes, and examining the complex dynamics at play within its lines.

The Power of the Reader:
Baudelaire's poem asserts that the reader plays a pivotal role in the creation of meaning. In the first stanza, he presents the book as a mirror, stating, "This book is like a mirror. When an angel or a demon looks into it, it shows him his own features." This metaphor implies that the reader brings their own perspective and experiences to the act of reading, thereby shaping the meaning of the text. Baudelaire's acknowledgment of the reader's active participation underscores the significance of interpretation and subjectivity in the reading process.

The Incompleteness of the Text:
The second stanza expands upon the idea of the reader's contribution to the text's meaning. Baudelaire emphasizes that the book itself is incomplete, urging readers to go beyond its surface. He writes, "You who hold this book and gaze at the image it presents, you have to bear in mind that it is not complete." This line alludes to the limitations of written language and highlights the necessity for the reader to engage their imagination and draw upon their own experiences to fill in the gaps left by the author. Baudelaire's words remind us that the act of reading goes beyond mere consumption of words; it requires active involvement and creative interpretation.

The Reader's Imagination:
Baudelaire's poem suggests that the reader's imagination is a powerful tool in understanding and appreciating literature. He implores the reader not to confine themselves to the written word but to embrace the freedom of their imagination. Baudelaire concludes the poem with the lines, "Do not trust any guide who only tells you the literal meaning, the book is only the shadow of a dream." This statement implies that the true essence of a work lies in the reader's ability to perceive and interpret the underlying themes and emotions, transcending the mere literal meaning of the words on the page.

The Poet's Intent:
Baudelaire's intention with "To the Reader" was to communicate his message in a way that would captivate and inspire the reader. Through the confident and self-assured tone of the poem, he demonstrates his belief in the power of his words to evoke emotions and provoke thought. By encouraging the reader to actively participate in the reading experience, Baudelaire seeks to forge a deeper connection between himself and the reader, urging them to become co-creators of meaning.

Conclusion:
In Charles Baudelaire's "To the Reader," the reader is positioned as an active participant, crucial in the creation of meaning within the text. Baudelaire's skillful use of metaphor and imagery highlights the dynamic relationship between the author and the reader, emphasizing the reader's interpretive power and the need for imagination. By inviting readers to engage their own experiences and fill in the gaps left by the author, Baudelaire presents reading as a collaborative and transformative process. Ultimately, "To the Reader" serves as a poignant reminder that literature is not static but rather an ever-evolving art form that thrives on the interplay between the author's words and the reader's interpretation.""";
}
