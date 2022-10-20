// Base classes for CoR
part of patterns;

/// Base Handler
/// 
/// [Context] here can be dynamic
abstract class Handler<Context>  {
  /// Given the context, the [Handler] handles the request
  void handle(Context context);
}

/// Base Handler Chain
/// 
/// Can be used to chain [Handler]s
abstract class HandlerChain<Context> extends Handler<Context>  {
  
  /// Queue Handler
  void queue(Handler<Context> handler);
  
  /// Replace Handler in the chain
  void update(Handler<Context> oldHandler, Handler<Context> newHandler);
}