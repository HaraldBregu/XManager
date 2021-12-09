package io.realm;


import android.util.JsonReader;
import io.realm.ImportFlag;
import io.realm.internal.ColumnInfo;
import io.realm.internal.OsObjectSchemaInfo;
import io.realm.internal.OsSchemaInfo;
import io.realm.internal.RealmObjectProxy;
import io.realm.internal.RealmProxyMediator;
import io.realm.internal.Row;
import java.io.IOException;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;

@io.realm.annotations.RealmModule
class DefaultRealmModuleMediator extends RealmProxyMediator {

    private static final Set<Class<? extends RealmModel>> MODEL_CLASSES;
    static {
        Set<Class<? extends RealmModel>> modelClasses = new HashSet<Class<? extends RealmModel>>(5);
        modelClasses.add(it.ninespartans.xmanager.model.TrainingSessionProgram.class);
        modelClasses.add(it.ninespartans.xmanager.model.User.class);
        modelClasses.add(it.ninespartans.xmanager.model.Player.class);
        modelClasses.add(it.ninespartans.xmanager.model.Device.class);
        modelClasses.add(it.ninespartans.xmanager.model.Program.class);
        MODEL_CLASSES = Collections.unmodifiableSet(modelClasses);
    }

    @Override
    public Map<Class<? extends RealmModel>, OsObjectSchemaInfo> getExpectedObjectSchemaInfoMap() {
        Map<Class<? extends RealmModel>, OsObjectSchemaInfo> infoMap = new HashMap<Class<? extends RealmModel>, OsObjectSchemaInfo>(5);
        infoMap.put(it.ninespartans.xmanager.model.TrainingSessionProgram.class, io.realm.it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy.getExpectedObjectSchemaInfo());
        infoMap.put(it.ninespartans.xmanager.model.User.class, io.realm.it_ninespartans_xmanager_model_UserRealmProxy.getExpectedObjectSchemaInfo());
        infoMap.put(it.ninespartans.xmanager.model.Player.class, io.realm.it_ninespartans_xmanager_model_PlayerRealmProxy.getExpectedObjectSchemaInfo());
        infoMap.put(it.ninespartans.xmanager.model.Device.class, io.realm.it_ninespartans_xmanager_model_DeviceRealmProxy.getExpectedObjectSchemaInfo());
        infoMap.put(it.ninespartans.xmanager.model.Program.class, io.realm.it_ninespartans_xmanager_model_ProgramRealmProxy.getExpectedObjectSchemaInfo());
        return infoMap;
    }

    @Override
    public ColumnInfo createColumnInfo(Class<? extends RealmModel> clazz, OsSchemaInfo schemaInfo) {
        checkClass(clazz);

        if (clazz.equals(it.ninespartans.xmanager.model.TrainingSessionProgram.class)) {
            return io.realm.it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy.createColumnInfo(schemaInfo);
        }
        if (clazz.equals(it.ninespartans.xmanager.model.User.class)) {
            return io.realm.it_ninespartans_xmanager_model_UserRealmProxy.createColumnInfo(schemaInfo);
        }
        if (clazz.equals(it.ninespartans.xmanager.model.Player.class)) {
            return io.realm.it_ninespartans_xmanager_model_PlayerRealmProxy.createColumnInfo(schemaInfo);
        }
        if (clazz.equals(it.ninespartans.xmanager.model.Device.class)) {
            return io.realm.it_ninespartans_xmanager_model_DeviceRealmProxy.createColumnInfo(schemaInfo);
        }
        if (clazz.equals(it.ninespartans.xmanager.model.Program.class)) {
            return io.realm.it_ninespartans_xmanager_model_ProgramRealmProxy.createColumnInfo(schemaInfo);
        }
        throw getMissingProxyClassException(clazz);
    }

    @Override
    public String getSimpleClassNameImpl(Class<? extends RealmModel> clazz) {
        checkClass(clazz);

        if (clazz.equals(it.ninespartans.xmanager.model.TrainingSessionProgram.class)) {
            return "TrainingSessionProgram";
        }
        if (clazz.equals(it.ninespartans.xmanager.model.User.class)) {
            return "User";
        }
        if (clazz.equals(it.ninespartans.xmanager.model.Player.class)) {
            return "Player";
        }
        if (clazz.equals(it.ninespartans.xmanager.model.Device.class)) {
            return "Device";
        }
        if (clazz.equals(it.ninespartans.xmanager.model.Program.class)) {
            return "Program";
        }
        throw getMissingProxyClassException(clazz);
    }

    @Override
    public Class<? extends RealmModel> getClazzImpl(String className) {
        checkClassName(className);

        if (className.equals("TrainingSessionProgram")) {
            return it.ninespartans.xmanager.model.TrainingSessionProgram.class;
        }
        if (className.equals("User")) {
            return it.ninespartans.xmanager.model.User.class;
        }
        if (className.equals("Player")) {
            return it.ninespartans.xmanager.model.Player.class;
        }
        if (className.equals("Device")) {
            return it.ninespartans.xmanager.model.Device.class;
        }
        if (className.equals("Program")) {
            return it.ninespartans.xmanager.model.Program.class;
        }
        throw getMissingProxyClassException(className);
    }

    @Override
    public boolean hasPrimaryKeyImpl(Class<? extends RealmModel> clazz) {
        return it.ninespartans.xmanager.model.TrainingSessionProgram.class.isAssignableFrom(clazz)
                || it.ninespartans.xmanager.model.User.class.isAssignableFrom(clazz)
                || it.ninespartans.xmanager.model.Player.class.isAssignableFrom(clazz)
                || it.ninespartans.xmanager.model.Device.class.isAssignableFrom(clazz);
    }

    @Override
    public <E extends RealmModel> E newInstance(Class<E> clazz, Object baseRealm, Row row, ColumnInfo columnInfo, boolean acceptDefaultValue, List<String> excludeFields) {
        final BaseRealm.RealmObjectContext objectContext = BaseRealm.objectContext.get();
        try {
            objectContext.set((BaseRealm) baseRealm, row, columnInfo, acceptDefaultValue, excludeFields);
            checkClass(clazz);

            if (clazz.equals(it.ninespartans.xmanager.model.TrainingSessionProgram.class)) {
                return clazz.cast(new io.realm.it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy());
            }
            if (clazz.equals(it.ninespartans.xmanager.model.User.class)) {
                return clazz.cast(new io.realm.it_ninespartans_xmanager_model_UserRealmProxy());
            }
            if (clazz.equals(it.ninespartans.xmanager.model.Player.class)) {
                return clazz.cast(new io.realm.it_ninespartans_xmanager_model_PlayerRealmProxy());
            }
            if (clazz.equals(it.ninespartans.xmanager.model.Device.class)) {
                return clazz.cast(new io.realm.it_ninespartans_xmanager_model_DeviceRealmProxy());
            }
            if (clazz.equals(it.ninespartans.xmanager.model.Program.class)) {
                return clazz.cast(new io.realm.it_ninespartans_xmanager_model_ProgramRealmProxy());
            }
            throw getMissingProxyClassException(clazz);
        } finally {
            objectContext.clear();
        }
    }

    @Override
    public Set<Class<? extends RealmModel>> getModelClasses() {
        return MODEL_CLASSES;
    }

    @Override
    public <E extends RealmModel> E copyOrUpdate(Realm realm, E obj, boolean update, Map<RealmModel, RealmObjectProxy> cache, Set<ImportFlag> flags) {
        // This cast is correct because obj is either
        // generated by RealmProxy or the original type extending directly from RealmObject
        @SuppressWarnings("unchecked") Class<E> clazz = (Class<E>) ((obj instanceof RealmObjectProxy) ? obj.getClass().getSuperclass() : obj.getClass());

        if (clazz.equals(it.ninespartans.xmanager.model.TrainingSessionProgram.class)) {
            it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy.TrainingSessionProgramColumnInfo columnInfo = (it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy.TrainingSessionProgramColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.TrainingSessionProgram.class);
            return clazz.cast(io.realm.it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy.copyOrUpdate(realm, columnInfo, (it.ninespartans.xmanager.model.TrainingSessionProgram) obj, update, cache, flags));
        }
        if (clazz.equals(it.ninespartans.xmanager.model.User.class)) {
            it_ninespartans_xmanager_model_UserRealmProxy.UserColumnInfo columnInfo = (it_ninespartans_xmanager_model_UserRealmProxy.UserColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.User.class);
            return clazz.cast(io.realm.it_ninespartans_xmanager_model_UserRealmProxy.copyOrUpdate(realm, columnInfo, (it.ninespartans.xmanager.model.User) obj, update, cache, flags));
        }
        if (clazz.equals(it.ninespartans.xmanager.model.Player.class)) {
            it_ninespartans_xmanager_model_PlayerRealmProxy.PlayerColumnInfo columnInfo = (it_ninespartans_xmanager_model_PlayerRealmProxy.PlayerColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Player.class);
            return clazz.cast(io.realm.it_ninespartans_xmanager_model_PlayerRealmProxy.copyOrUpdate(realm, columnInfo, (it.ninespartans.xmanager.model.Player) obj, update, cache, flags));
        }
        if (clazz.equals(it.ninespartans.xmanager.model.Device.class)) {
            it_ninespartans_xmanager_model_DeviceRealmProxy.DeviceColumnInfo columnInfo = (it_ninespartans_xmanager_model_DeviceRealmProxy.DeviceColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Device.class);
            return clazz.cast(io.realm.it_ninespartans_xmanager_model_DeviceRealmProxy.copyOrUpdate(realm, columnInfo, (it.ninespartans.xmanager.model.Device) obj, update, cache, flags));
        }
        if (clazz.equals(it.ninespartans.xmanager.model.Program.class)) {
            it_ninespartans_xmanager_model_ProgramRealmProxy.ProgramColumnInfo columnInfo = (it_ninespartans_xmanager_model_ProgramRealmProxy.ProgramColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Program.class);
            return clazz.cast(io.realm.it_ninespartans_xmanager_model_ProgramRealmProxy.copyOrUpdate(realm, columnInfo, (it.ninespartans.xmanager.model.Program) obj, update, cache, flags));
        }
        throw getMissingProxyClassException(clazz);
    }

    @Override
    public long insert(Realm realm, RealmModel object, Map<RealmModel, Long> cache) {
        // This cast is correct because obj is either
        // generated by RealmProxy or the original type extending directly from RealmObject
        @SuppressWarnings("unchecked") Class<RealmModel> clazz = (Class<RealmModel>) ((object instanceof RealmObjectProxy) ? object.getClass().getSuperclass() : object.getClass());

        if (clazz.equals(it.ninespartans.xmanager.model.TrainingSessionProgram.class)) {
            return io.realm.it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy.insert(realm, (it.ninespartans.xmanager.model.TrainingSessionProgram) object, cache);
        } else if (clazz.equals(it.ninespartans.xmanager.model.User.class)) {
            return io.realm.it_ninespartans_xmanager_model_UserRealmProxy.insert(realm, (it.ninespartans.xmanager.model.User) object, cache);
        } else if (clazz.equals(it.ninespartans.xmanager.model.Player.class)) {
            return io.realm.it_ninespartans_xmanager_model_PlayerRealmProxy.insert(realm, (it.ninespartans.xmanager.model.Player) object, cache);
        } else if (clazz.equals(it.ninespartans.xmanager.model.Device.class)) {
            return io.realm.it_ninespartans_xmanager_model_DeviceRealmProxy.insert(realm, (it.ninespartans.xmanager.model.Device) object, cache);
        } else if (clazz.equals(it.ninespartans.xmanager.model.Program.class)) {
            throw new IllegalArgumentException("Embedded objects cannot be copied into Realm by themselves. They need to be attached to a parent object");
        } else {
            throw getMissingProxyClassException(clazz);
        }
    }

    @Override
    public void insert(Realm realm, Collection<? extends RealmModel> objects) {
        Iterator<? extends RealmModel> iterator = objects.iterator();
        RealmModel object = null;
        Map<RealmModel, Long> cache = new HashMap<RealmModel, Long>(objects.size());
        if (iterator.hasNext()) {
            //  access the first element to figure out the clazz for the routing below
            object = iterator.next();
            // This cast is correct because obj is either
            // generated by RealmProxy or the original type extending directly from RealmObject
            @SuppressWarnings("unchecked") Class<RealmModel> clazz = (Class<RealmModel>) ((object instanceof RealmObjectProxy) ? object.getClass().getSuperclass() : object.getClass());

            if (clazz.equals(it.ninespartans.xmanager.model.TrainingSessionProgram.class)) {
                io.realm.it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy.insert(realm, (it.ninespartans.xmanager.model.TrainingSessionProgram) object, cache);
            } else if (clazz.equals(it.ninespartans.xmanager.model.User.class)) {
                io.realm.it_ninespartans_xmanager_model_UserRealmProxy.insert(realm, (it.ninespartans.xmanager.model.User) object, cache);
            } else if (clazz.equals(it.ninespartans.xmanager.model.Player.class)) {
                io.realm.it_ninespartans_xmanager_model_PlayerRealmProxy.insert(realm, (it.ninespartans.xmanager.model.Player) object, cache);
            } else if (clazz.equals(it.ninespartans.xmanager.model.Device.class)) {
                io.realm.it_ninespartans_xmanager_model_DeviceRealmProxy.insert(realm, (it.ninespartans.xmanager.model.Device) object, cache);
            } else if (clazz.equals(it.ninespartans.xmanager.model.Program.class)) {
                throw new IllegalArgumentException("Embedded objects cannot be copied into Realm by themselves. They need to be attached to a parent object");
            } else {
                throw getMissingProxyClassException(clazz);
            }
            if (iterator.hasNext()) {
                if (clazz.equals(it.ninespartans.xmanager.model.TrainingSessionProgram.class)) {
                    io.realm.it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy.insert(realm, iterator, cache);
                } else if (clazz.equals(it.ninespartans.xmanager.model.User.class)) {
                    io.realm.it_ninespartans_xmanager_model_UserRealmProxy.insert(realm, iterator, cache);
                } else if (clazz.equals(it.ninespartans.xmanager.model.Player.class)) {
                    io.realm.it_ninespartans_xmanager_model_PlayerRealmProxy.insert(realm, iterator, cache);
                } else if (clazz.equals(it.ninespartans.xmanager.model.Device.class)) {
                    io.realm.it_ninespartans_xmanager_model_DeviceRealmProxy.insert(realm, iterator, cache);
                } else if (clazz.equals(it.ninespartans.xmanager.model.Program.class)) {
                    throw new IllegalArgumentException("Embedded objects cannot be copied into Realm by themselves. They need to be attached to a parent object");
                } else {
                    throw getMissingProxyClassException(clazz);
                }
            }
        }
    }

    @Override
    public long insertOrUpdate(Realm realm, RealmModel obj, Map<RealmModel, Long> cache) {
        // This cast is correct because obj is either
        // generated by RealmProxy or the original type extending directly from RealmObject
        @SuppressWarnings("unchecked") Class<RealmModel> clazz = (Class<RealmModel>) ((obj instanceof RealmObjectProxy) ? obj.getClass().getSuperclass() : obj.getClass());

        if (clazz.equals(it.ninespartans.xmanager.model.TrainingSessionProgram.class)) {
            return io.realm.it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy.insertOrUpdate(realm, (it.ninespartans.xmanager.model.TrainingSessionProgram) obj, cache);
        } else if (clazz.equals(it.ninespartans.xmanager.model.User.class)) {
            return io.realm.it_ninespartans_xmanager_model_UserRealmProxy.insertOrUpdate(realm, (it.ninespartans.xmanager.model.User) obj, cache);
        } else if (clazz.equals(it.ninespartans.xmanager.model.Player.class)) {
            return io.realm.it_ninespartans_xmanager_model_PlayerRealmProxy.insertOrUpdate(realm, (it.ninespartans.xmanager.model.Player) obj, cache);
        } else if (clazz.equals(it.ninespartans.xmanager.model.Device.class)) {
            return io.realm.it_ninespartans_xmanager_model_DeviceRealmProxy.insertOrUpdate(realm, (it.ninespartans.xmanager.model.Device) obj, cache);
        } else if (clazz.equals(it.ninespartans.xmanager.model.Program.class)) {
            throw new IllegalArgumentException("Embedded objects cannot be copied into Realm by themselves. They need to be attached to a parent object");
        } else {
            throw getMissingProxyClassException(clazz);
        }
    }

    @Override
    public void insertOrUpdate(Realm realm, Collection<? extends RealmModel> objects) {
        Iterator<? extends RealmModel> iterator = objects.iterator();
        RealmModel object = null;
        Map<RealmModel, Long> cache = new HashMap<RealmModel, Long>(objects.size());
        if (iterator.hasNext()) {
            //  access the first element to figure out the clazz for the routing below
            object = iterator.next();
            // This cast is correct because obj is either
            // generated by RealmProxy or the original type extending directly from RealmObject
            @SuppressWarnings("unchecked") Class<RealmModel> clazz = (Class<RealmModel>) ((object instanceof RealmObjectProxy) ? object.getClass().getSuperclass() : object.getClass());

            if (clazz.equals(it.ninespartans.xmanager.model.TrainingSessionProgram.class)) {
                io.realm.it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy.insertOrUpdate(realm, (it.ninespartans.xmanager.model.TrainingSessionProgram) object, cache);
            } else if (clazz.equals(it.ninespartans.xmanager.model.User.class)) {
                io.realm.it_ninespartans_xmanager_model_UserRealmProxy.insertOrUpdate(realm, (it.ninespartans.xmanager.model.User) object, cache);
            } else if (clazz.equals(it.ninespartans.xmanager.model.Player.class)) {
                io.realm.it_ninespartans_xmanager_model_PlayerRealmProxy.insertOrUpdate(realm, (it.ninespartans.xmanager.model.Player) object, cache);
            } else if (clazz.equals(it.ninespartans.xmanager.model.Device.class)) {
                io.realm.it_ninespartans_xmanager_model_DeviceRealmProxy.insertOrUpdate(realm, (it.ninespartans.xmanager.model.Device) object, cache);
            } else if (clazz.equals(it.ninespartans.xmanager.model.Program.class)) {
                throw new IllegalArgumentException("Embedded objects cannot be copied into Realm by themselves. They need to be attached to a parent object");
            } else {
                throw getMissingProxyClassException(clazz);
            }
            if (iterator.hasNext()) {
                if (clazz.equals(it.ninespartans.xmanager.model.TrainingSessionProgram.class)) {
                    io.realm.it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy.insertOrUpdate(realm, iterator, cache);
                } else if (clazz.equals(it.ninespartans.xmanager.model.User.class)) {
                    io.realm.it_ninespartans_xmanager_model_UserRealmProxy.insertOrUpdate(realm, iterator, cache);
                } else if (clazz.equals(it.ninespartans.xmanager.model.Player.class)) {
                    io.realm.it_ninespartans_xmanager_model_PlayerRealmProxy.insertOrUpdate(realm, iterator, cache);
                } else if (clazz.equals(it.ninespartans.xmanager.model.Device.class)) {
                    io.realm.it_ninespartans_xmanager_model_DeviceRealmProxy.insertOrUpdate(realm, iterator, cache);
                } else if (clazz.equals(it.ninespartans.xmanager.model.Program.class)) {
                    throw new IllegalArgumentException("Embedded objects cannot be copied into Realm by themselves. They need to be attached to a parent object");
                } else {
                    throw getMissingProxyClassException(clazz);
                }
            }
        }
    }

    @Override
    public <E extends RealmModel> E createOrUpdateUsingJsonObject(Class<E> clazz, Realm realm, JSONObject json, boolean update)
        throws JSONException {
        checkClass(clazz);

        if (clazz.equals(it.ninespartans.xmanager.model.TrainingSessionProgram.class)) {
            return clazz.cast(io.realm.it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy.createOrUpdateUsingJsonObject(realm, json, update));
        }
        if (clazz.equals(it.ninespartans.xmanager.model.User.class)) {
            return clazz.cast(io.realm.it_ninespartans_xmanager_model_UserRealmProxy.createOrUpdateUsingJsonObject(realm, json, update));
        }
        if (clazz.equals(it.ninespartans.xmanager.model.Player.class)) {
            return clazz.cast(io.realm.it_ninespartans_xmanager_model_PlayerRealmProxy.createOrUpdateUsingJsonObject(realm, json, update));
        }
        if (clazz.equals(it.ninespartans.xmanager.model.Device.class)) {
            return clazz.cast(io.realm.it_ninespartans_xmanager_model_DeviceRealmProxy.createOrUpdateUsingJsonObject(realm, json, update));
        }
        if (clazz.equals(it.ninespartans.xmanager.model.Program.class)) {
            throw new IllegalArgumentException("Importing embedded classes from JSON without a parent is not allowed");
        }
        throw getMissingProxyClassException(clazz);
    }

    @Override
    public <E extends RealmModel> E createUsingJsonStream(Class<E> clazz, Realm realm, JsonReader reader)
        throws IOException {
        checkClass(clazz);

        if (clazz.equals(it.ninespartans.xmanager.model.TrainingSessionProgram.class)) {
            return clazz.cast(io.realm.it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy.createUsingJsonStream(realm, reader));
        }
        if (clazz.equals(it.ninespartans.xmanager.model.User.class)) {
            return clazz.cast(io.realm.it_ninespartans_xmanager_model_UserRealmProxy.createUsingJsonStream(realm, reader));
        }
        if (clazz.equals(it.ninespartans.xmanager.model.Player.class)) {
            return clazz.cast(io.realm.it_ninespartans_xmanager_model_PlayerRealmProxy.createUsingJsonStream(realm, reader));
        }
        if (clazz.equals(it.ninespartans.xmanager.model.Device.class)) {
            return clazz.cast(io.realm.it_ninespartans_xmanager_model_DeviceRealmProxy.createUsingJsonStream(realm, reader));
        }
        if (clazz.equals(it.ninespartans.xmanager.model.Program.class)) {
            throw new IllegalArgumentException("Importing embedded classes from JSON without a parent is not allowed");
        }
        throw getMissingProxyClassException(clazz);
    }

    @Override
    public <E extends RealmModel> E createDetachedCopy(E realmObject, int maxDepth, Map<RealmModel, RealmObjectProxy.CacheData<RealmModel>> cache) {
        // This cast is correct because obj is either
        // generated by RealmProxy or the original type extending directly from RealmObject
        @SuppressWarnings("unchecked") Class<E> clazz = (Class<E>) realmObject.getClass().getSuperclass();

        if (clazz.equals(it.ninespartans.xmanager.model.TrainingSessionProgram.class)) {
            return clazz.cast(io.realm.it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy.createDetachedCopy((it.ninespartans.xmanager.model.TrainingSessionProgram) realmObject, 0, maxDepth, cache));
        }
        if (clazz.equals(it.ninespartans.xmanager.model.User.class)) {
            return clazz.cast(io.realm.it_ninespartans_xmanager_model_UserRealmProxy.createDetachedCopy((it.ninespartans.xmanager.model.User) realmObject, 0, maxDepth, cache));
        }
        if (clazz.equals(it.ninespartans.xmanager.model.Player.class)) {
            return clazz.cast(io.realm.it_ninespartans_xmanager_model_PlayerRealmProxy.createDetachedCopy((it.ninespartans.xmanager.model.Player) realmObject, 0, maxDepth, cache));
        }
        if (clazz.equals(it.ninespartans.xmanager.model.Device.class)) {
            return clazz.cast(io.realm.it_ninespartans_xmanager_model_DeviceRealmProxy.createDetachedCopy((it.ninespartans.xmanager.model.Device) realmObject, 0, maxDepth, cache));
        }
        if (clazz.equals(it.ninespartans.xmanager.model.Program.class)) {
            return clazz.cast(io.realm.it_ninespartans_xmanager_model_ProgramRealmProxy.createDetachedCopy((it.ninespartans.xmanager.model.Program) realmObject, 0, maxDepth, cache));
        }
        throw getMissingProxyClassException(clazz);
    }

    @Override
    public <E extends RealmModel> boolean isEmbedded(Class<E> clazz) {
        if (clazz.equals(it.ninespartans.xmanager.model.TrainingSessionProgram.class)) {
            return false;
        }
        if (clazz.equals(it.ninespartans.xmanager.model.User.class)) {
            return false;
        }
        if (clazz.equals(it.ninespartans.xmanager.model.Player.class)) {
            return false;
        }
        if (clazz.equals(it.ninespartans.xmanager.model.Device.class)) {
            return false;
        }
        if (clazz.equals(it.ninespartans.xmanager.model.Program.class)) {
            return true;
        }
        throw getMissingProxyClassException(clazz);
    }

    @Override
    public <E extends RealmModel> void updateEmbeddedObject(Realm realm, E unmanagedObject, E managedObject, Map<RealmModel, RealmObjectProxy> cache, Set<ImportFlag> flags) {
        // This cast is correct because obj is either
        // generated by RealmProxy or the original type extending directly from RealmObject
        @SuppressWarnings("unchecked") Class<E> clazz = (Class<E>) managedObject.getClass().getSuperclass();

        if (clazz.equals(it.ninespartans.xmanager.model.TrainingSessionProgram.class)) {
            throw getNotEmbeddedClassException("it.ninespartans.xmanager.model.TrainingSessionProgram");
        } else if (clazz.equals(it.ninespartans.xmanager.model.User.class)) {
            throw getNotEmbeddedClassException("it.ninespartans.xmanager.model.User");
        } else if (clazz.equals(it.ninespartans.xmanager.model.Player.class)) {
            throw getNotEmbeddedClassException("it.ninespartans.xmanager.model.Player");
        } else if (clazz.equals(it.ninespartans.xmanager.model.Device.class)) {
            throw getNotEmbeddedClassException("it.ninespartans.xmanager.model.Device");
        } else if (clazz.equals(it.ninespartans.xmanager.model.Program.class)) {
            io.realm.it_ninespartans_xmanager_model_ProgramRealmProxy.updateEmbeddedObject(realm, (it.ninespartans.xmanager.model.Program) unmanagedObject, (it.ninespartans.xmanager.model.Program) managedObject, cache, flags);
        } else {
            throw getMissingProxyClassException(clazz);
        }
    }

}
