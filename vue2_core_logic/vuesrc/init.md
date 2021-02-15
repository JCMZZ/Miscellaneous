
```mermaid
  graph TD;
  _init -->initState
  initState -->|props<br/>methods<br/>data<br/>computed<br/>watch|初始化数据
  初始化数据 -->|data| observe`value`
```