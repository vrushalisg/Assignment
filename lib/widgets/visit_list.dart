import 'package:codinground/view_models/route_planner_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class VisitList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RoutePlannerViewModel>(context);
    final selectedVisits = viewModel.selectedVisits;

    return ListView.builder(
      itemCount: selectedVisits.length,
      itemBuilder: (context, index) {
        final visit = selectedVisits[index];
        return ListTile(
          title: Text(visit.name),
          subtitle: Text(visit.phoneNumber),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.phone),
                onPressed: () {
                  // Launch the call application here with visit.phoneNumber
                },
              ),
              IconButton(
                icon: Icon(Icons.arrow_upward),
                onPressed: () {
                  if (index > 0) {
                    viewModel.swapVisits(index, index - 1);
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.arrow_downward),
                onPressed: () {
                  if (index < selectedVisits.length - 1) {
                    viewModel.swapVisits(index, index + 1);
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  viewModel.deleteVisit(index);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
