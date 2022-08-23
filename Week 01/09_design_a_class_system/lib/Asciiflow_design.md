┌──────────────────────────────────┐                                ┌────────────────────────────────────┐
│ Diary class                      │                                │Diary                               │
│   @list = []               ──────┤                                │                                    │
│-add(entry(string)or todo(object)◄├─────┐ xx add(returnnothing)    │  @list = []                        │
│   check if string/todo and ──────┤     │ xx                       │  @todo_list = Todolist.new         │
│-read                             │     │                          │  -add(entry) (entry=String)        │
│   return(formatted)string        │     │                          │    return String                   │
│-select_readable(minutes(integer) │     │ wpm(integer))            │  -read, select_readable, list_contacts
│   return(formatted)string        │     │                          │  -add_todo(task)                   │
│-list_contacts                    │     │                          │    call_todo_list.new_task(task)   │
│   return(formatted)string        │     │                          │  -show_todos                       │
│                                  │     │                          │    call todo_list.tasks            │
└──────────────────────────────────┘     │                          └────────────────────────────────────┘
                                         │
                                         │
                                         │
┌──────────────────────────────────┐     │                          ┌────────────────────────────────────┐
│ TodoLists(task=stringing)        ├─────┘                          │TodoList                            │
│   @task = task                   │                                │                                    │
│                                  │                                │  @tasks = []                       │
│   attr_reader :task              │                                │                                    │
│                                  │                                │  attr_reader :tasks                │
│                                  │                                │                                    │
│                                  │                                │ -new_task(task)                    │
│                                  │                                │   add task to @tasks, return nil   │
│                                  │                                │                                    │
│                                  │                                │                                    │
│                                  │                                │                                    │
└──────────────────────────────────┘                                └────────────────────────────────────┘
