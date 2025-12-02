import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

void main() {
  runApp(const CaptchaLabApp());
}

class CaptchaLabApp extends StatelessWidget {
  const CaptchaLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FH BFI CAPTCHA Lab',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: const Color(0xFF005A9C),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: const Color(0xFF005A9C),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              scheme.primary.withOpacity(0.08),
              scheme.surface,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const _Header(),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    _SectionTitle(title: 'Classic Challenges'),
                    CaptchaCard(
                      title: 'Math CAPTCHA',
                      subtitle: 'Solve a small equation.',
                      icon: Icons.calculate,
                      accentColor: Colors.teal,
                      pageBuilder: (_) => const MathCaptchaPage(),
                    ),
                    CaptchaCard(
                      title: 'Tap CAPTCHA',
                      subtitle: 'Tap the correct cat icon.',
                      icon: Icons.touch_app,
                      accentColor: Colors.orange,
                      pageBuilder: (_) => const TapCaptchaPage(),
                    ),
                    CaptchaCard(
                      title: 'Slider CAPTCHA',
                      subtitle: 'Align the slider with the target.',
                      icon: Icons.tune,
                      accentColor: Colors.purple,
                      pageBuilder: (_) => const SliderCaptchaPage(),
                    ),
                    CaptchaCard(
                      title: 'Pattern CAPTCHA',
                      subtitle: 'Reproduce the hidden pattern.',
                      icon: Icons.grid_3x3,
                      accentColor: Colors.green,
                      pageBuilder: (_) => const PatternCaptchaPage(),
                    ),
                    const SizedBox(height: 24),
                    _SectionTitle(title: 'Advanced Experiments'),
                    CaptchaCard(
                      title: 'Puzzle CAPTCHA',
                      subtitle: 'Order the tiles into the correct sequence.',
                      icon: Icons.extension,
                      accentColor: Colors.blue,
                      pageBuilder: (_) => const PuzzleCaptchaPage(),
                    ),
                    CaptchaCard(
                      title: 'Drag & Drop CAPTCHA',
                      subtitle: 'Drag the token onto the correct target.',
                      icon: Icons.drag_indicator,
                      accentColor: Colors.red,
                      pageBuilder: (_) => const DragDropCaptchaPage(),
                    ),
                    CaptchaCard(
                      title: 'Sequence CAPTCHA',
                      subtitle: 'Memorise and repeat the colour sequence.',
                      icon: Icons.memory,
                      accentColor: Colors.indigo,
                      pageBuilder: (_) => const SequenceCaptchaPage(),
                    ),
                    CaptchaCard(
                      title: 'Gesture CAPTCHA',
                      subtitle: 'Swipe in the requested direction pattern.',
                      icon: Icons.swipe,
                      accentColor: Colors.pink,
                      pageBuilder: (_) => const GestureCaptchaPage(),
                    ),
                    const SizedBox(height: 32),
                    Center(
                      child: Text(
                        'FH des BFI Wien – CAPTCHA Lab',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: scheme.primaryContainer.withOpacity(0.9),
        boxShadow: [
          BoxShadow(
            color: scheme.shadow.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white, // white background for logo
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SvgPicture.asset(
                'assets/fh_logo_blue.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'FH BFI Vienna',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  'Offline CAPTCHA Laboratory',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          IconButton(
            tooltip: 'Security notes',
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SecurityNotesPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 18,
            decoration: BoxDecoration(
              color: scheme.primary,
              borderRadius: BorderRadius.circular(999),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}

class CaptchaCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color accentColor;
  final WidgetBuilder pageBuilder;

  const CaptchaCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accentColor,
    required this.pageBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: pageBuilder),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      accentColor.withOpacity(0.2),
                      accentColor.withOpacity(0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Icon(icon, color: accentColor),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: scheme.outline),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- Shared widgets ----------------

class SolvedOverlay extends StatefulWidget {
  final Widget child;
  final bool solved;

  const SolvedOverlay({super.key, required this.child, required this.solved});

  @override
  State<SolvedOverlay> createState() => _SolvedOverlayState();
}

class _SolvedOverlayState extends State<SolvedOverlay> {
  late ConfettiController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 1));
    if (widget.solved) {
      _controller.play();
    }
  }

  @override
  void didUpdateWidget(covariant SolvedOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.solved && !oldWidget.solved) {
      _controller.play();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (widget.solved)
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _controller,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
            ),
          ),
      ],
    );
  }
}

// ---------------- Security Notes ----------------

class SecurityNotesPage extends StatelessWidget {
  const SecurityNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security Notes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              'Offline CAPTCHA Lab – Security Notes',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              'This application is designed for teaching and experimentation. '
              'All CAPTCHA mechanisms are implemented fully on the client side.',
              style: textStyle,
            ),
            const SizedBox(height: 16),
            Text(
              'Limitations of client-only CAPTCHAs:',
              style: textStyle?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const BulletText('- Logic can be reverse-engineered.'),
            const BulletText('- Bots can simulate gestures and input.'),
            const BulletText(
                '- No server-side verification or rate limiting included.'),
            const SizedBox(height: 16),
            Text(
              'Good use cases:',
              style: textStyle?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const BulletText('• Didactic demonstrations in lectures.'),
            const BulletText('• UI/UX prototyping.'),
            const BulletText('• Games and gamified learning.'),
            const BulletText('• Offline applications.'),
            const SizedBox(height: 16),
            Text(
              'For production-grade security, always combine server-validated '
              'CAPTCHAs (e.g. reCAPTCHA, Turnstile) with rate limiting, '
              'device attestation and behavioural analysis.',
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class BulletText extends StatelessWidget {
  final String text;
  const BulletText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('•  '),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}

// --------------- Classic CAPTCHAs ----------------

// Math
class MathCaptchaPage extends StatefulWidget {
  const MathCaptchaPage({super.key});

  @override
  State<MathCaptchaPage> createState() => _MathCaptchaPageState();
}

class _MathCaptchaPageState extends State<MathCaptchaPage> {
  late int a, b;
  bool solved = false;
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _generate();
  }

  void _generate() {
    final now = DateTime.now();
    a = (now.second % 9) + 1;
    b = (now.millisecond % 9) + 1;
    controller.clear();
    solved = false;
  }

  void _verify() {
    final ans = int.tryParse(controller.text.trim());
    if (ans == a + b) {
      setState(() => solved = true);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Correct 👍')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Wrong answer')),
      );
      _generate();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Math CAPTCHA')),
      body: SolvedOverlay(
        solved: solved,
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(24),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Solve the equation',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '$a + $b = ?',
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onSubmitted: (_) => _verify(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter result',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: _verify,
                        icon: const Icon(Icons.check),
                        label: const Text('Verify'),
                      ),
                      const SizedBox(width: 12),
                      TextButton(
                        onPressed: () {
                          _generate();
                          setState(() {});
                        },
                        child: const Text('New challenge'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Tap
class TapCaptchaPage extends StatefulWidget {
  const TapCaptchaPage({super.key});

  @override
  State<TapCaptchaPage> createState() => _TapCaptchaPageState();
}

class _TapCaptchaPageState extends State<TapCaptchaPage> {
  final List<_IconOption> options = [
    _IconOption(Icons.pets, 'Cat', true),
    _IconOption(Icons.directions_car, 'Car', false),
    _IconOption(Icons.flight, 'Plane', false),
    _IconOption(Icons.home, 'House', false),
  ];

  @override
  void initState() {
    super.initState();
    options.shuffle();
  }

  void _handleTap(_IconOption opt) {
    if (opt.isCorrect) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Correct cat 🐱')),
      );
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Wrong icon')),
      );
      setState(() {
        options.shuffle();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tap CAPTCHA')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Tap the CAT icon',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 24,
              runSpacing: 24,
              children: options
                  .map(
                    (opt) => InkWell(
                      onTap: () => _handleTap(opt),
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(opt.icon, size: 40),
                            const SizedBox(height: 4),
                            Text(opt.label),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _IconOption {
  final IconData icon;
  final String label;
  final bool isCorrect;
  _IconOption(this.icon, this.label, this.isCorrect);
}

// Slider
class SliderCaptchaPage extends StatefulWidget {
  const SliderCaptchaPage({super.key});

  @override
  State<SliderCaptchaPage> createState() => _SliderCaptchaPageState();
}

class _SliderCaptchaPageState extends State<SliderCaptchaPage> {
  late double target;
  double value = 0.0;
  bool showHint = false;

  @override
  void initState() {
    super.initState();
    _generate();
  }

  void _generate() {
    target = (DateTime.now().millisecond % 70) / 100 + 0.15;
    value = 0.0;
    showHint = false;
  }

  void _verify() {
    if ((value - target).abs() < 0.06) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Good alignment 👌')),
      );
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Too far away')),
      );
      _generate();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 80;
    return Scaffold(
      appBar: AppBar(title: const Text('Slider CAPTCHA')),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(24),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Align the slider',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Move the slider so that it matches the hidden target position.',
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: width,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                      if (showHint)
                        Positioned(
                          left: target * width,
                          child: Container(
                            width: 4,
                            height: 20,
                            color: Colors.redAccent,
                          ),
                        ),
                      Slider(
                        value: value,
                        onChanged: (v) {
                          setState(() {
                            value = v;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          showHint = !showHint;
                        });
                      },
                      child: Text(showHint ? 'Hide hint' : 'Show hint'),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: _verify,
                      child: const Text('Verify'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Pattern
class PatternCaptchaPage extends StatefulWidget {
  const PatternCaptchaPage({super.key});

  @override
  State<PatternCaptchaPage> createState() => _PatternCaptchaPageState();
}

class _PatternCaptchaPageState extends State<PatternCaptchaPage> {
  final List<int> pattern = [];
  final List<int> correct = [0, 1, 4, 7];

  void _tap(int index) {
    if (!pattern.contains(index)) {
      setState(() {
        pattern.add(index);
      });
    }
    if (pattern.length == correct.length) {
      if (_matches()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Correct pattern ✅')),
        );
        Navigator.of(context).pop();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Incorrect pattern')),
        );
        setState(() {
          pattern.clear();
        });
      }
    }
  }

  bool _matches() {
    if (pattern.length != correct.length) return false;
    for (int i = 0; i < correct.length; i++) {
      if (pattern[i] != correct[i]) return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final tiles = List.generate(9, (i) {
      final selected = pattern.contains(i);
      return GestureDetector(
        onTap: () => _tap(i),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: selected ? Colors.teal : Colors.grey.withOpacity(0.2),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: Colors.teal.withOpacity(0.4),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    )
                  ]
                : [],
          ),
          child: Center(
            child: Text(
              '${i + 1}',
              style: TextStyle(
                color: selected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Pattern CAPTCHA')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Tap tiles to reproduce the secret pattern.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 220,
              height: 220,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                children: tiles,
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  pattern.clear();
                });
              },
              child: const Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }
}

// --------------- Advanced CAPTCHAs ----------------

// Puzzle CAPTCHA (simple 3x3 permutation)
class PuzzleCaptchaPage extends StatefulWidget {
  const PuzzleCaptchaPage({super.key});

  @override
  State<PuzzleCaptchaPage> createState() => _PuzzleCaptchaPageState();
}

class _PuzzleCaptchaPageState extends State<PuzzleCaptchaPage> {
  late List<int> tiles;

  @override
  void initState() {
    super.initState();
    tiles = List<int>.generate(8, (i) => i + 1) + [0];
    tiles.shuffle();
  }

  bool get _isSolved {
    for (int i = 0; i < 8; i++) {
      if (tiles[i] != i + 1) return false;
    }
    return tiles[8] == 0;
  }

  void _tap(int index) {
    final emptyIndex = tiles.indexOf(0);
    final diff = (emptyIndex - index).abs();
    final sameRow = emptyIndex ~/ 3 == index ~/ 3;
    final sameCol = emptyIndex % 3 == index % 3;
    if ((sameRow && diff == 1) || (sameCol && diff == 3)) {
      setState(() {
        final tmp = tiles[emptyIndex];
        tiles[emptyIndex] = tiles[index];
        tiles[index] = tmp;
      });
      if (_isSolved) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Puzzle solved 🎉')),
        );
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final tileWidgets = List.generate(9, (i) {
      final value = tiles[i];
      final isEmpty = value == 0;
      return GestureDetector(
        onTap: () => _tap(i),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isEmpty ? Colors.transparent : Colors.blue.withOpacity(0.7),
            borderRadius: BorderRadius.circular(12),
            border: isEmpty
                ? Border.all(color: Colors.grey.withOpacity(0.3))
                : null,
          ),
          child: Center(
            child: isEmpty
                ? const SizedBox.shrink()
                : Text(
                    '$value',
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
          ),
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Puzzle CAPTCHA')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Reorder the tiles into the right sequence.'),
            const SizedBox(height: 16),
            SizedBox(
              width: 260,
              height: 260,
              child: GridView.count(
                crossAxisCount: 3,
                children: tileWidgets,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Drag & Drop CAPTCHA
class DragDropCaptchaPage extends StatefulWidget {
  const DragDropCaptchaPage({super.key});

  @override
  State<DragDropCaptchaPage> createState() => _DragDropCaptchaPageState();
}

class _DragDropCaptchaPageState extends State<DragDropCaptchaPage> {
  String? droppedOn;

  void _handleDrop(String label) {
    setState(() {
      droppedOn = label;
    });
    if (label == 'Robot') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Correct target 🤖')),
      );
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Wrong target')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final token = Draggable<String>(
      data: 'bot',
      feedback: const _Token(label: 'BOT'),
      childWhenDragging: const _Token(label: '...'),
      child: const _Token(label: 'BOT'),
    );

    final targets = [
      _DropTarget(
        label: 'Human',
        icon: Icons.person,
        onAccept: () => _handleDrop('Human'),
      ),
      _DropTarget(
        label: 'Robot',
        icon: Icons.smart_toy,
        onAccept: () => _handleDrop('Robot'),
      ),
      _DropTarget(
        label: 'Server',
        icon: Icons.cloud,
        onAccept: () => _handleDrop('Server'),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Drag & Drop CAPTCHA')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Drag the BOT token onto the robot.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            token,
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: targets
                  .map((t) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: t,
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _Token extends StatelessWidget {
  final String label;
  const _Token({required this.label});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
      borderRadius: BorderRadius.circular(16),
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Text(
          label,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _DropTarget extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onAccept;

  const _DropTarget({
    required this.label,
    required this.icon,
    required this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      builder: (context, candidateData, rejectedData) {
        final hovered = candidateData.isNotEmpty;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: hovered ? Colors.green.withOpacity(0.2) : Colors.grey[200],
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.grey.withOpacity(0.5)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              const SizedBox(height: 4),
              Text(label),
            ],
          ),
        );
      },
      onAcceptWithDetails: (_) => onAccept(),
    );
  }
}

// Sequence CAPTCHA
class SequenceCaptchaPage extends StatefulWidget {
  const SequenceCaptchaPage({super.key});

  @override
  State<SequenceCaptchaPage> createState() => _SequenceCaptchaPageState();
}

class _SequenceCaptchaPageState extends State<SequenceCaptchaPage> {
  final List<_ColorPad> pads = [
    _ColorPad(Colors.red, 'R'),
    _ColorPad(Colors.green, 'G'),
    _ColorPad(Colors.blue, 'B'),
    _ColorPad(Colors.yellow, 'Y'),
  ];

  late List<String> sequence;
  List<String> input = [];
  bool showingSequence = false;

  @override
  void initState() {
    super.initState();
    _generate();
    _playSequence();
  }

  void _generate() {
    sequence = [];
    final rand = Random();
    for (int i = 0; i < 4; i++) {
      sequence.add(pads[rand.nextInt(pads.length)].code);
    }
    input.clear();
  }

  Future<void> _playSequence() async {
    setState(() {
      showingSequence = true;
    });
    for (final code in sequence) {
      setState(() {
        for (final p in pads) {
          p.active = (p.code == code);
        }
      });
      await Future.delayed(const Duration(milliseconds: 500));
      setState(() {
        for (final p in pads) {
          p.active = false;
        }
      });
      await Future.delayed(const Duration(milliseconds: 200));
    }
    setState(() {
      showingSequence = false;
    });
  }

  void _pressPad(_ColorPad pad) {
    if (showingSequence) return;
    setState(() {
      input.add(pad.code);
    });
    if (input.length == sequence.length) {
      if (_matches()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sequence correct 🎶')),
        );
        Navigator.of(context).pop();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Wrong sequence')),
        );
        _generate();
        _playSequence();
      }
    }
  }

  bool _matches() {
    if (input.length != sequence.length) return false;
    for (int i = 0; i < sequence.length; i++) {
      if (input[i] != sequence[i]) return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final padWidgets = pads
        .map(
          (p) => GestureDetector(
            onTap: () => _pressPad(p),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              margin: const EdgeInsets.all(8),
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: p.color.withOpacity(p.active ? 0.9 : 0.6),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Sequence CAPTCHA')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Memorise and repeat the colour sequence.'),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: showingSequence ? null : _playSequence,
              child: const Text('Replay sequence'),
            ),
            const SizedBox(height: 12),
            Wrap(
              alignment: WrapAlignment.center,
              children: padWidgets,
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorPad {
  final Color color;
  final String code;
  bool active = false;
  _ColorPad(this.color, this.code);
}

// Gesture CAPTCHA
class GestureCaptchaPage extends StatefulWidget {
  const GestureCaptchaPage({super.key});

  @override
  State<GestureCaptchaPage> createState() => _GestureCaptchaPageState();
}

class _GestureCaptchaPageState extends State<GestureCaptchaPage> {
  String requiredGesture = 'Swipe LEFT then RIGHT';
  List<String> performed = [];
  Offset _lastOffset = Offset.zero;

  void _onPanStart(DragStartDetails details) {
    performed.clear();
    _lastOffset = details.localPosition;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    final delta = details.localPosition - _lastOffset;
    _lastOffset = details.localPosition;
    if (delta.distance < 10) return;

    final isHorizontal = delta.dx.abs() > delta.dy.abs();
    if (isHorizontal) {
      if (delta.dx > 0) {
        _addGesture('RIGHT');
      } else {
        _addGesture('LEFT');
      }
    } else {
      if (delta.dy > 0) {
        _addGesture('DOWN');
      } else {
        _addGesture('UP');
      }
    }
  }

  void _addGesture(String dir) {
    if (performed.isEmpty || performed.last != dir) {
      performed.add(dir);
    }
  }

  void _onPanEnd(DragEndDetails details) {
    final pattern = performed.join('-');
    if (pattern.contains('LEFT-RIGHT')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gesture accepted ✋')),
      );
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gesture "$pattern" not accepted')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Gesture CAPTCHA')),
      body: Center(
        child: GestureDetector(
          onPanStart: _onPanStart,
          onPanUpdate: _onPanUpdate,
          onPanEnd: _onPanEnd,
          child: Container(
            margin: const EdgeInsets.all(24),
            height: 260,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                colors: [
                  scheme.primary.withOpacity(0.15),
                  scheme.surfaceContainerHighest.withOpacity(0.6),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Text(
                requiredGesture,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}