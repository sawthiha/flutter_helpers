import 'package:test/test.dart';

import 'package:dart_generics/dart_generics.dart';

import 'mock.dart';

void main()  {
  group('Command Test',
    ()  {
      group('CommandManager Test',
        ()  {
          test('register() Test',
            ()  {
              var commandManager = CommandManager();
              var command = CounterCommand();
              commandManager.register(command);
              expect(command.counter.count, 10);
              expect(commandManager.isUndoable, true);
            }
          );
          test('deregister() Test', ()  {
            var commandManager = CommandManager();
            var command = CounterCommand();
            commandManager.register(command);
            expect(command.counter.count, 10);
            expect(commandManager.isUndoable, true);
            commandManager.deregister(command);
            expect(commandManager.isUndoable, false);
            command.rollback();
            commandManager.register(command);
            commandManager.deregister(command, isToRollback: true);
            expect(command.counter.count, 0);
          });
          test('undo()/redo() Test',
            ()  {
              var commandManager = CommandManager();
              var command = CounterCommand();
              commandManager.register(command);
              expect(command.counter.count, 10);
              commandManager.undo();
              expect(command.counter.count, 0);
              commandManager.redo();
              expect(command.counter.count, 10);
            }
          );
          test('Undo&Modify integrity test!',
            ()  {
              var commandManager = CommandManager();
              var command = CounterCommand();
              commandManager.register(command);
              expect(commandManager.isUndoable, true);
              commandManager.undo();
              expect(commandManager.isRedoable, true);
              commandManager.register(CounterCommand());
              expect(commandManager.isRedoable, false);
              expect(commandManager.isUndoable, true);
              commandManager.undo();
              expect(commandManager.isUndoable, false);
            }
          );
          test('clear() Test',
            ()  {
              var commandManager = CommandManager();
              var command = CounterCommand();
              commandManager.register(command);
              commandManager.clear();
              expect(commandManager.isUndoable, false);
              expect(commandManager.isRedoable, false);
            }
          );
        }
      );
    }
  );
}