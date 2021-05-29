import 'package:flutter/material.dart';
import 'package:soar_app/configs/palette.dart';
import 'package:soar_app/data/inspections_data.dart';
import 'package:soar_app/data/templates_data.dart';
import 'package:soar_app/models/inspection.dart';
import 'package:soar_app/models/template.dart';
import 'package:soar_app/utils/utils.dart';
import 'package:soar_app/widgets/widgets.dart';

class InspectionsScreen extends StatefulWidget {
  final List<Template> templateList = TemplatesData.templates;
  final List<Inspection> inspectionList = InspectionsData.inspections;

  @override
  _InspectionsScreenState createState() => _InspectionsScreenState();
}

class _InspectionsScreenState extends State<InspectionsScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomAppBarWidget(),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(ThemeConstants.borderRadius),
                  color: Palette.gray_6,
                ),
                child: TabBar(
                  onTap: (index) {},
                  controller: _tabController,
                  isScrollable: true,
                  indicatorColor: Palette.gray_6,
                  labelColor: Palette.primaryColor,
                  unselectedLabelColor: Palette.gray_3,
                  labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  indicator: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(ThemeConstants.borderRadius),
                    border: Border.all(
                      color: Palette.primaryColor,
                      width: 1.5,
                    ),
                  ),
                  tabs: [
                    _tabContainer("Templates"),
                    _tabContainer("In Progress & Complete"),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 15.0,
                bottom: 30.0,
                right: 15.0,
              ),
              child: Row(
                children: [
                  Expanded(child: _searchBox()),
                  Container(
                    margin: EdgeInsets.only(left: 7.0),
                    child: GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        print("Filter");
                      },
                      child: Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              ThemeConstants.borderRadius),
                          color: Palette.gray_6,
                        ),
                        child: Icon(
                          SoarIcon.sort_amount_down,
                          color: Palette.gray_4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: widget?.templateList?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TemplateListWidget(
                        template: widget.templateList[index],
                      );
                    },
                  ),
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: widget?.inspectionList?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InspectionListWidget(
                          inspection: widget.inspectionList[index]);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Container _tabContainer(String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 7.0),
    child: Text(
      text.toUpperCase(),
      style: TextStyle(
        fontFamily: ThemeConstants.font,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.5,
      ),
    ),
  );
}

TextField _searchBox() {
  return TextField(
    style: TextStyle(
      color: Palette.gray_1,
      fontSize: 20.0,
      letterSpacing: 1.5,
    ),
    textAlignVertical: TextAlignVertical.center,
    cursorColor: Palette.primaryColor,
    decoration: InputDecoration(
      hintText: "Search",
      hintStyle: TextStyle(
        color: Palette.gray_3,
        fontSize: 17.0,
        letterSpacing: 1.5,
        fontFamily: ThemeConstants.font,
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: 12.0,
      ),
      prefixIcon: Icon(
        Icons.search,
        size: 30.0,
        color: Palette.gray_4,
      ),
      filled: true,
      fillColor: Palette.gray_6,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ThemeConstants.borderRadius),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ThemeConstants.borderRadius),
        borderSide: BorderSide(color: Palette.primaryColor),
      ),
    ),
  );
}
