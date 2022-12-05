class Task {
  int currentPage;
  List<Data> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Links> links;
  Null nextPageUrl;
  String path;
  int perPage;
  Null prevPageUrl;
  int to;
  int total;

  Task(
      {required this.currentPage,
      required this.data,
      required this.firstPageUrl,
      required this.from,
      required this.lastPage,
      required this.lastPageUrl,
      required this.links,
      required this.nextPageUrl,
      required this.path,
      required this.perPage,
      required this.prevPageUrl,
      required this.to,
      required this.total});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int taskId;
  String taskName;
  String taskDescription;
  int taskPriority;
  int activeTask;
  int highestPriority;
  int mediumPriority;
  int lowestPriority;

  Data(
      {required this.taskId,
      required this.taskName,
      required this.taskDescription,
      required this.taskPriority,
      required this.activeTask,
      required this.highestPriority,
      required this.mediumPriority,
      required this.lowestPriority});

  Data.fromJson(Map<String, dynamic> json)
      : taskId = json['task_id'],
        taskName = json['task_name'],
        taskDescription = json['task_description'],
        taskPriority = json['task_priority'],
        activeTask = json['active_task'],
        highestPriority = json['highest_priority'],
        mediumPriority = json['medium_priority'],
        lowestPriority = json['lowest_priority'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['task_id'] = this.taskId;
    data['task_name'] = this.taskName;
    data['task_description'] = this.taskDescription;
    data['task_priority'] = this.taskPriority;
    data['active_task'] = this.activeTask;
    data['highest_priority'] = this.highestPriority;
    data['medium_priority'] = this.mediumPriority;
    data['lowest_priority'] = this.lowestPriority;
    return data;
  }
}

class Links {
  String url;
  String label;
  bool active;

  Links({required this.url, required this.label, required this.active});

  Links.fromJson(Map<String, dynamic> json)
      : url = json['url'],
        label = json['label'],
        active = json['active'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
