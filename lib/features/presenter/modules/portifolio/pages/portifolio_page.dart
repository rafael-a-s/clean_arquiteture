import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/features/domain/entities/assets.dart';
import 'package:my_app/features/domain/entities/portifolio.dart';
import 'package:my_app/features/presenter/modules/portifolio/widget/bottom-sheats/portifolio-page/modal_delete_portifolio.dart';
import 'package:my_app/features/presenter/modules/portifolio/widget/bottom-sheats/portifolio-page/modal_edit_asset.dart';
import 'package:my_app/features/presenter/modules/portifolio/widget/bottom-sheats/portifolio-page/modal_edit_name_portifolio.dart';
import 'package:my_app/features/presenter/modules/portifolio/widget/bottom-sheats/portifolio-page/modal_trade_in_asset.dart';
import 'package:my_app/features/presenter/modules/portifolio/widget/card-portifolio/card_portifolio.dart';
import 'package:my_app/features/presenter/modules/portifolio/widget/list-portifolio/list_card.dart';
import 'package:my_app/features/presenter/root.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PortifolioPage extends StatefulWidget {
  Portifolio portifolio;

  PortifolioPage({
    super.key,
    required this.portifolio,
  });

  @override
  State<StatefulWidget> createState() => _PortifolioPage();
}

class _PortifolioPage extends State<PortifolioPage> {
  void _modalEditNamePortifolio(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return ModalEditNamePortifolio(portifolio: widget.portifolio);
        });
  }

  void _modalEditPriceAsset(context, Assets asset) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return ModalEditAssetPortifolio(
            id: widget.portifolio.id,
            asset: asset,
          );
        });
  }

  void _modalTradeInAsset(context, Assets asset) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return ModalTradeInAssetPortifolio(
              id: widget.portifolio.id, asset: asset);
        });
  }

  _modalDeletePortifolio(BuildContext context, dynamic id) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return ModalDeletePortifolio(
            portifolio: widget.portifolio,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 15,
        right: 15,
      ),
      height: double.maxFinite,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Modular.to.navigate('/home/'),
              ),
              Text(
                widget.portifolio.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.help),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Slidable(
            key: const ValueKey(0),
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  autoClose: true,
                  backgroundColor: const Color(RootStyle.bgColor),
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Editar',
                  onPressed: (BuildContext context) {
                    _modalEditNamePortifolio(context);
                  },
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  backgroundColor: const Color(RootStyle.bgColor),
                  foregroundColor: Colors.white,
                  icon: Icons.remove,
                  label: 'Remover',
                  onPressed: (BuildContext context) {
                    _modalDeletePortifolio(context, widget.portifolio.id);
                  },
                )
              ],
            ),
            child: CardPortifolio(
              portifolio: widget.portifolio,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Carteira',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () => {
                      Modular.to.navigate(
                        '/portifolio/new-asset',
                        arguments: widget.portifolio,
                      )
                    },
                    icon: const Icon(
                      Icons.add,
                    ),
                    hoverColor: const Color(RootStyle.bgColor),
                  ),
                  const Text('Adicionar Compra')
                ],
              )
            ],
          ),
          Expanded(
            child: widget.portifolio.assets.isNotEmpty
                ? ListView.builder(
                    itemCount: widget.portifolio.assets.length,
                    itemBuilder: (context, item) {
                      return Slidable(
                        key: const ValueKey(0),
                        startActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              backgroundColor: const Color(RootStyle.bgColor),
                              foregroundColor: Colors.white,
                              icon: Icons.edit,
                              label: 'Editar',
                              onPressed: (BuildContext context) {
                                _modalEditPriceAsset(
                                    context, widget.portifolio.assets[item]);
                              },
                            ),
                          ],
                        ),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              backgroundColor: const Color(RootStyle.bgColor),
                              foregroundColor: Colors.red,
                              icon: Icons.swipe_down,
                              label: 'Vender',
                              onPressed: (BuildContext context) {
                                _modalTradeInAsset(
                                    context, widget.portifolio.assets[item]);
                              },
                            )
                          ],
                        ),
                        child: ListCardPortifolio(
                          assets: widget.portifolio.assets[item],
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text('Sem resultados encontrados.'),
                  ),
          ),
        ],
      ),
    );
  }
}
