UDJrb is a set of classes and extensions to make it easier to work with the UniData Java API. UDJrb includes a copy of `asjava.jar`, and loads it automatically when you require the library. So, all you need to get start is to install UDJrb via `gem install udjrb` and require it with `require 'udjrb'`.

UDJrb::Session
==============

To connect to a UniData database, use the `UDJrb::Session` object.

    session = UDJrb::Session.new "username", "password", "host", "account"

This will automatically connect you to the database. Once you're connected, there are a few methods available to you:

 * `session.unijava` - returns the underlying `asjava.uniobjects.UniJava` object.
 * `session.session` - returns the underlying `UniSession` object.
 * `session.disconnect` - disconnect cleanly from the database (uses `UniJava#closeSession()`).

Any other method you call will be passed through to the underlying `UniSession` object, which means you can open files, etc. just by calling the method you would normally call on a `UniSession` instance:

    person = session.open "PERSON"
    person.set_record_id "0123456"
    puts "First Name: #{person.read_named_field 'FIRST.NAME'}"
    puts "Last Name:  #{person.read_named_field 'LAST.NAME'}"

UniFile Extensions
==================

The following extensions have been added to `UniFile`:

 * `file.data(field)` - convienence method for `file.read_named_field(field)`.

UniDynArray Extensions
======================

The following extensions have been added to `UniDynArray`:

 * `each` - returns each value from the first field in the array (`to_s` is called on each element).
 * `include Enumerable` - gives access to the [Enumerable](http://www.ruby-doc.org/core/classes/Enumerable.html) methods by way of `each`.
