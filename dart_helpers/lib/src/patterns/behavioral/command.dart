// Command pattern
part of patterns;

/// Base class for Command
abstract class Command  {
  void execute();
  void rollback();
}

/// Command Manager
class CommandManager  {
  final Queue<Command> _undoables = Queue();
  final Queue<Command> _redoables = Queue();

  /// Register a new command.
  /// 
  /// If [isToBeExecuted], the command's execute() will be called.
  void register(Command command, {bool isToBeExecuted = true})  {
    if(isToBeExecuted)  command.execute();
    _undoables.addLast(command);
    if(isRedoable) _redoables.clear();
  }

  /// Remove a registered command
  /// 
  /// If [isToBeRollback], the command's rollback() will be called.
  void deregister(Command command, {bool isToRollback = false})  {
    _undoables.remove(command);
    _redoables.remove(command);
    if(isToRollback) command.rollback();
  }

  /// Check if the manager in undoable state
  bool get isUndoable => _undoables.isNotEmpty;
  /// Check if the manager in redoable state
  bool get isRedoable => _redoables.isNotEmpty;

  /// Undo the most recent done/redone command
  void undo()  {
    if(isUndoable)  {
      var command = _undoables.removeLast();
      command.rollback();
      _redoables.addLast(command);
    }
  }

  /// Redo the most recent undone command
  void redo()  {
    if(isRedoable)  {
      var command = _redoables.removeLast();
      command.execute();
      _undoables.addLast(command);
    }
  }

  /// Clear
  void clear()  {
    _undoables.clear();
    _redoables.clear();
  }

}