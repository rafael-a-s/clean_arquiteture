import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_app/core/utils/status-screen-arguments/StatusScreenArgument.dart';
import 'package:my_app/features/presenter/root.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({
    super.key,
    required this.arguments,
  });

  final StatusScreenArguments arguments;

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  String pathIconSucess = 'assets/svg/check-circle.svg';
  String pathIconError = 'assets/svg/x-circle.svg';
  late String title;

  @override
  void initState() {
    super.initState();
    title = widget.arguments.isError ? 'Ops! Ocorreu um erro.' : 'Sucesso!';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(RootStyle.defaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  widget.arguments.isError ? pathIconError : pathIconSucess,
                  width: 120,
                  height: 120,
                ),
                Text(
                  title,
                  style: RootStyle.title1Style,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  widget.arguments.message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(RootStyle.ptColor).withOpacity(0.8),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            child: TextButton(
              style: ButtonStyle(
                minimumSize: const MaterialStatePropertyAll<Size?>(
                  Size(double.infinity, 50),
                ),
                backgroundColor: MaterialStatePropertyAll<Color?>(
                  Color(
                    widget.arguments.isError
                        ? RootStyle.ptColor
                        : RootStyle.winerColor,
                  ),
                ),
              ),
              onPressed: widget.arguments.onPressed,
              child: const Text(
                'Ok',
                style: TextStyle(
                  color: Color(
                    RootStyle.ptColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
