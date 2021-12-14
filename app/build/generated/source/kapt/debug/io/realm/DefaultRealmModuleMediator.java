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
        modelClasses.add(com.ninespartans.xmanager.model.ProgramData.class);
        modelClasses.add(com.ninespartans.xmanager.model.DeviceProgram.class);
        modelClasses.add(com.ninespartans.xmanager.model.User.class);
        modelClasses.add(com.ninespartans.xmanager.model.Account.class);
        modelClasses.add(com.ninespartans.xmanager.model.Device.class);
        MODEL_CLASSES = Collections.unmodifiableSet(modelClasses);
    }

    @Override
    public Map<Class<? extends RealmModel>, OsObjectSchemaInfo> getExpectedObjectSchemaInfoMap() {
        Map<Class<? extends RealmModel>, OsObjectSchemaInfo> infoMap = new HashMap<Class<? extends RealmModel>, OsObjectSchemaInfo>(5);
        infoMap.put(com.ninespartans.xmanager.model.ProgramData.class, io.realm.com_ninespartans_xmanager_model_ProgramDataRealmProxy.getExpectedObjectSchemaInfo());
        infoMap.put(com.ninespartans.xmanager.model.DeviceProgram.class, io.realm.com_ninespartans_xmanager_model_DeviceProgramRealmProxy.getExpectedObjectSchemaInfo());
        infoMap.put(com.ninespartans.xmanager.model.User.class, io.realm.com_ninespartans_xmanager_model_UserRealmProxy.getExpectedObjectSchemaInfo());
        infoMap.put(com.ninespartans.xmanager.model.Account.class, io.realm.com_ninespartans_xmanager_model_AccountRealmProxy.getExpectedObjectSchemaInfo());
        infoMap.put(com.ninespartans.xmanager.model.Device.class, io.realm.com_ninespartans_xmanager_model_DeviceRealmProxy.getExpectedObjectSchemaInfo());
        return infoMap;
    }

    @Override
    public ColumnInfo createColumnInfo(Class<? extends RealmModel> clazz, OsSchemaInfo schemaInfo) {
        checkClass(clazz);

        if (clazz.equals(com.ninespartans.xmanager.model.ProgramData.class)) {
            return io.realm.com_ninespartans_xmanager_model_ProgramDataRealmProxy.createColumnInfo(schemaInfo);
        }
        if (clazz.equals(com.ninespartans.xmanager.model.DeviceProgram.class)) {
            return io.realm.com_ninespartans_xmanager_model_DeviceProgramRealmProxy.createColumnInfo(schemaInfo);
        }
        if (clazz.equals(com.ninespartans.xmanager.model.User.class)) {
            return io.realm.com_ninespartans_xmanager_model_UserRealmProxy.createColumnInfo(schemaInfo);
        }
        if (clazz.equals(com.ninespartans.xmanager.model.Account.class)) {
            return io.realm.com_ninespartans_xmanager_model_AccountRealmProxy.createColumnInfo(schemaInfo);
        }
        if (clazz.equals(com.ninespartans.xmanager.model.Device.class)) {
            return io.realm.com_ninespartans_xmanager_model_DeviceRealmProxy.createColumnInfo(schemaInfo);
        }
        throw getMissingProxyClassException(clazz);
    }

    @Override
    public String getSimpleClassNameImpl(Class<? extends RealmModel> clazz) {
        checkClass(clazz);

        if (clazz.equals(com.ninespartans.xmanager.model.ProgramData.class)) {
            return "ProgramData";
        }
        if (clazz.equals(com.ninespartans.xmanager.model.DeviceProgram.class)) {
            return "DeviceProgram";
        }
        if (clazz.equals(com.ninespartans.xmanager.model.User.class)) {
            return "User";
        }
        if (clazz.equals(com.ninespartans.xmanager.model.Account.class)) {
            return "Account";
        }
        if (clazz.equals(com.ninespartans.xmanager.model.Device.class)) {
            return "Device";
        }
        throw getMissingProxyClassException(clazz);
    }

    @Override
    public Class<? extends RealmModel> getClazzImpl(String className) {
        checkClassName(className);

        if (className.equals("ProgramData")) {
            return com.ninespartans.xmanager.model.ProgramData.class;
        }
        if (className.equals("DeviceProgram")) {
            return com.ninespartans.xmanager.model.DeviceProgram.class;
        }
        if (className.equals("User")) {
            return com.ninespartans.xmanager.model.User.class;
        }
        if (className.equals("Account")) {
            return com.ninespartans.xmanager.model.Account.class;
        }
        if (className.equals("Device")) {
            return com.ninespartans.xmanager.model.Device.class;
        }
        throw getMissingProxyClassException(className);
    }

    @Override
    public boolean hasPrimaryKeyImpl(Class<? extends RealmModel> clazz) {
        return com.ninespartans.xmanager.model.DeviceProgram.class.isAssignableFrom(clazz)
                || com.ninespartans.xmanager.model.User.class.isAssignableFrom(clazz)
                || com.ninespartans.xmanager.model.Account.class.isAssignableFrom(clazz)
                || com.ninespartans.xmanager.model.Device.class.isAssignableFrom(clazz);
    }

    @Override
    public <E extends RealmModel> E newInstance(Class<E> clazz, Object baseRealm, Row row, ColumnInfo columnInfo, boolean acceptDefaultValue, List<String> excludeFields) {
        final BaseRealm.RealmObjectContext objectContext = BaseRealm.objectContext.get();
        try {
            objectContext.set((BaseRealm) baseRealm, row, columnInfo, acceptDefaultValue, excludeFields);
            checkClass(clazz);

            if (clazz.equals(com.ninespartans.xmanager.model.ProgramData.class)) {
                return clazz.cast(new io.realm.com_ninespartans_xmanager_model_ProgramDataRealmProxy());
            }
            if (clazz.equals(com.ninespartans.xmanager.model.DeviceProgram.class)) {
                return clazz.cast(new io.realm.com_ninespartans_xmanager_model_DeviceProgramRealmProxy());
            }
            if (clazz.equals(com.ninespartans.xmanager.model.User.class)) {
                return clazz.cast(new io.realm.com_ninespartans_xmanager_model_UserRealmProxy());
            }
            if (clazz.equals(com.ninespartans.xmanager.model.Account.class)) {
                return clazz.cast(new io.realm.com_ninespartans_xmanager_model_AccountRealmProxy());
            }
            if (clazz.equals(com.ninespartans.xmanager.model.Device.class)) {
                return clazz.cast(new io.realm.com_ninespartans_xmanager_model_DeviceRealmProxy());
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

        if (clazz.equals(com.ninespartans.xmanager.model.ProgramData.class)) {
            com_ninespartans_xmanager_model_ProgramDataRealmProxy.ProgramDataColumnInfo columnInfo = (com_ninespartans_xmanager_model_ProgramDataRealmProxy.ProgramDataColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.ProgramData.class);
            return clazz.cast(io.realm.com_ninespartans_xmanager_model_ProgramDataRealmProxy.copyOrUpdate(realm, columnInfo, (com.ninespartans.xmanager.model.ProgramData) obj, update, cache, flags));
        }
        if (clazz.equals(com.ninespartans.xmanager.model.DeviceProgram.class)) {
            com_ninespartans_xmanager_model_DeviceProgramRealmProxy.DeviceProgramColumnInfo columnInfo = (com_ninespartans_xmanager_model_DeviceProgramRealmProxy.DeviceProgramColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.DeviceProgram.class);
            return clazz.cast(io.realm.com_ninespartans_xmanager_model_DeviceProgramRealmProxy.copyOrUpdate(realm, columnInfo, (com.ninespartans.xmanager.model.DeviceProgram) obj, update, cache, flags));
        }
        if (clazz.equals(com.ninespartans.xmanager.model.User.class)) {
            com_ninespartans_xmanager_model_UserRealmProxy.UserColumnInfo columnInfo = (com_ninespartans_xmanager_model_UserRealmProxy.UserColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.User.class);
            return clazz.cast(io.realm.com_ninespartans_xmanager_model_UserRealmProxy.copyOrUpdate(realm, columnInfo, (com.ninespartans.xmanager.model.User) obj, update, cache, flags));
        }
        if (clazz.equals(com.ninespartans.xmanager.model.Account.class)) {
            com_ninespartans_xmanager_model_AccountRealmProxy.AccountColumnInfo columnInfo = (com_ninespartans_xmanager_model_AccountRealmProxy.AccountColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.Account.class);
            return clazz.cast(io.realm.com_ninespartans_xmanager_model_AccountRealmProxy.copyOrUpdate(realm, columnInfo, (com.ninespartans.xmanager.model.Account) obj, update, cache, flags));
        }
        if (clazz.equals(com.ninespartans.xmanager.model.Device.class)) {
            com_ninespartans_xmanager_model_DeviceRealmProxy.DeviceColumnInfo columnInfo = (com_ninespartans_xmanager_model_DeviceRealmProxy.DeviceColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.Device.class);
            return clazz.cast(io.realm.com_ninespartans_xmanager_model_DeviceRealmProxy.copyOrUpdate(realm, columnInfo, (com.ninespartans.xmanager.model.Device) obj, update, cache, flags));
        }
        throw getMissingProxyClassException(clazz);
    }

    @Override
    public long insert(Realm realm, RealmModel object, Map<RealmModel, Long> cache) {
        // This cast is correct because obj is either
        // generated by RealmProxy or the original type extending directly from RealmObject
        @SuppressWarnings("unchecked") Class<RealmModel> clazz = (Class<RealmModel>) ((object instanceof RealmObjectProxy) ? object.getClass().getSuperclass() : object.getClass());

        if (clazz.equals(com.ninespartans.xmanager.model.ProgramData.class)) {
            throw new IllegalArgumentException("Embedded objects cannot be copied into Realm by themselves. They need to be attached to a parent object");
        } else if (clazz.equals(com.ninespartans.xmanager.model.DeviceProgram.class)) {
            return io.realm.com_ninespartans_xmanager_model_DeviceProgramRealmProxy.insert(realm, (com.ninespartans.xmanager.model.DeviceProgram) object, cache);
        } else if (clazz.equals(com.ninespartans.xmanager.model.User.class)) {
            return io.realm.com_ninespartans_xmanager_model_UserRealmProxy.insert(realm, (com.ninespartans.xmanager.model.User) object, cache);
        } else if (clazz.equals(com.ninespartans.xmanager.model.Account.class)) {
            return io.realm.com_ninespartans_xmanager_model_AccountRealmProxy.insert(realm, (com.ninespartans.xmanager.model.Account) object, cache);
        } else if (clazz.equals(com.ninespartans.xmanager.model.Device.class)) {
            return io.realm.com_ninespartans_xmanager_model_DeviceRealmProxy.insert(realm, (com.ninespartans.xmanager.model.Device) object, cache);
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

            if (clazz.equals(com.ninespartans.xmanager.model.ProgramData.class)) {
                throw new IllegalArgumentException("Embedded objects cannot be copied into Realm by themselves. They need to be attached to a parent object");
            } else if (clazz.equals(com.ninespartans.xmanager.model.DeviceProgram.class)) {
                io.realm.com_ninespartans_xmanager_model_DeviceProgramRealmProxy.insert(realm, (com.ninespartans.xmanager.model.DeviceProgram) object, cache);
            } else if (clazz.equals(com.ninespartans.xmanager.model.User.class)) {
                io.realm.com_ninespartans_xmanager_model_UserRealmProxy.insert(realm, (com.ninespartans.xmanager.model.User) object, cache);
            } else if (clazz.equals(com.ninespartans.xmanager.model.Account.class)) {
                io.realm.com_ninespartans_xmanager_model_AccountRealmProxy.insert(realm, (com.ninespartans.xmanager.model.Account) object, cache);
            } else if (clazz.equals(com.ninespartans.xmanager.model.Device.class)) {
                io.realm.com_ninespartans_xmanager_model_DeviceRealmProxy.insert(realm, (com.ninespartans.xmanager.model.Device) object, cache);
            } else {
                throw getMissingProxyClassException(clazz);
            }
            if (iterator.hasNext()) {
                if (clazz.equals(com.ninespartans.xmanager.model.ProgramData.class)) {
                    throw new IllegalArgumentException("Embedded objects cannot be copied into Realm by themselves. They need to be attached to a parent object");
                } else if (clazz.equals(com.ninespartans.xmanager.model.DeviceProgram.class)) {
                    io.realm.com_ninespartans_xmanager_model_DeviceProgramRealmProxy.insert(realm, iterator, cache);
                } else if (clazz.equals(com.ninespartans.xmanager.model.User.class)) {
                    io.realm.com_ninespartans_xmanager_model_UserRealmProxy.insert(realm, iterator, cache);
                } else if (clazz.equals(com.ninespartans.xmanager.model.Account.class)) {
                    io.realm.com_ninespartans_xmanager_model_AccountRealmProxy.insert(realm, iterator, cache);
                } else if (clazz.equals(com.ninespartans.xmanager.model.Device.class)) {
                    io.realm.com_ninespartans_xmanager_model_DeviceRealmProxy.insert(realm, iterator, cache);
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

        if (clazz.equals(com.ninespartans.xmanager.model.ProgramData.class)) {
            throw new IllegalArgumentException("Embedded objects cannot be copied into Realm by themselves. They need to be attached to a parent object");
        } else if (clazz.equals(com.ninespartans.xmanager.model.DeviceProgram.class)) {
            return io.realm.com_ninespartans_xmanager_model_DeviceProgramRealmProxy.insertOrUpdate(realm, (com.ninespartans.xmanager.model.DeviceProgram) obj, cache);
        } else if (clazz.equals(com.ninespartans.xmanager.model.User.class)) {
            return io.realm.com_ninespartans_xmanager_model_UserRealmProxy.insertOrUpdate(realm, (com.ninespartans.xmanager.model.User) obj, cache);
        } else if (clazz.equals(com.ninespartans.xmanager.model.Account.class)) {
            return io.realm.com_ninespartans_xmanager_model_AccountRealmProxy.insertOrUpdate(realm, (com.ninespartans.xmanager.model.Account) obj, cache);
        } else if (clazz.equals(com.ninespartans.xmanager.model.Device.class)) {
            return io.realm.com_ninespartans_xmanager_model_DeviceRealmProxy.insertOrUpdate(realm, (com.ninespartans.xmanager.model.Device) obj, cache);
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

            if (clazz.equals(com.ninespartans.xmanager.model.ProgramData.class)) {
                throw new IllegalArgumentException("Embedded objects cannot be copied into Realm by themselves. They need to be attached to a parent object");
            } else if (clazz.equals(com.ninespartans.xmanager.model.DeviceProgram.class)) {
                io.realm.com_ninespartans_xmanager_model_DeviceProgramRealmProxy.insertOrUpdate(realm, (com.ninespartans.xmanager.model.DeviceProgram) object, cache);
            } else if (clazz.equals(com.ninespartans.xmanager.model.User.class)) {
                io.realm.com_ninespartans_xmanager_model_UserRealmProxy.insertOrUpdate(realm, (com.ninespartans.xmanager.model.User) object, cache);
            } else if (clazz.equals(com.ninespartans.xmanager.model.Account.class)) {
                io.realm.com_ninespartans_xmanager_model_AccountRealmProxy.insertOrUpdate(realm, (com.ninespartans.xmanager.model.Account) object, cache);
            } else if (clazz.equals(com.ninespartans.xmanager.model.Device.class)) {
                io.realm.com_ninespartans_xmanager_model_DeviceRealmProxy.insertOrUpdate(realm, (com.ninespartans.xmanager.model.Device) object, cache);
            } else {
                throw getMissingProxyClassException(clazz);
            }
            if (iterator.hasNext()) {
                if (clazz.equals(com.ninespartans.xmanager.model.ProgramData.class)) {
                    throw new IllegalArgumentException("Embedded objects cannot be copied into Realm by themselves. They need to be attached to a parent object");
                } else if (clazz.equals(com.ninespartans.xmanager.model.DeviceProgram.class)) {
                    io.realm.com_ninespartans_xmanager_model_DeviceProgramRealmProxy.insertOrUpdate(realm, iterator, cache);
                } else if (clazz.equals(com.ninespartans.xmanager.model.User.class)) {
                    io.realm.com_ninespartans_xmanager_model_UserRealmProxy.insertOrUpdate(realm, iterator, cache);
                } else if (clazz.equals(com.ninespartans.xmanager.model.Account.class)) {
                    io.realm.com_ninespartans_xmanager_model_AccountRealmProxy.insertOrUpdate(realm, iterator, cache);
                } else if (clazz.equals(com.ninespartans.xmanager.model.Device.class)) {
                    io.realm.com_ninespartans_xmanager_model_DeviceRealmProxy.insertOrUpdate(realm, iterator, cache);
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

        if (clazz.equals(com.ninespartans.xmanager.model.ProgramData.class)) {
            throw new IllegalArgumentException("Importing embedded classes from JSON without a parent is not allowed");
        }
        if (clazz.equals(com.ninespartans.xmanager.model.DeviceProgram.class)) {
            return clazz.cast(io.realm.com_ninespartans_xmanager_model_DeviceProgramRealmProxy.createOrUpdateUsingJsonObject(realm, json, update));
        }
        if (clazz.equals(com.ninespartans.xmanager.model.User.class)) {
            return clazz.cast(io.realm.com_ninespartans_xmanager_model_UserRealmProxy.createOrUpdateUsingJsonObject(realm, json, update));
        }
        if (clazz.equals(com.ninespartans.xmanager.model.Account.class)) {
            return clazz.cast(io.realm.com_ninespartans_xmanager_model_AccountRealmProxy.createOrUpdateUsingJsonObject(realm, json, update));
        }
        if (clazz.equals(com.ninespartans.xmanager.model.Device.class)) {
            return clazz.cast(io.realm.com_ninespartans_xmanager_model_DeviceRealmProxy.createOrUpdateUsingJsonObject(realm, json, update));
        }
        throw getMissingProxyClassException(clazz);
    }

    @Override
    public <E extends RealmModel> E createUsingJsonStream(Class<E> clazz, Realm realm, JsonReader reader)
        throws IOException {
        checkClass(clazz);

        if (clazz.equals(com.ninespartans.xmanager.model.ProgramData.class)) {
            throw new IllegalArgumentException("Importing embedded classes from JSON without a parent is not allowed");
        }
        if (clazz.equals(com.ninespartans.xmanager.model.DeviceProgram.class)) {
            return clazz.cast(io.realm.com_ninespartans_xmanager_model_DeviceProgramRealmProxy.createUsingJsonStream(realm, reader));
        }
        if (clazz.equals(com.ninespartans.xmanager.model.User.class)) {
            return clazz.cast(io.realm.com_ninespartans_xmanager_model_UserRealmProxy.createUsingJsonStream(realm, reader));
        }
        if (clazz.equals(com.ninespartans.xmanager.model.Account.class)) {
            return clazz.cast(io.realm.com_ninespartans_xmanager_model_AccountRealmProxy.createUsingJsonStream(realm, reader));
        }
        if (clazz.equals(com.ninespartans.xmanager.model.Device.class)) {
            return clazz.cast(io.realm.com_ninespartans_xmanager_model_DeviceRealmProxy.createUsingJsonStream(realm, reader));
        }
        throw getMissingProxyClassException(clazz);
    }

    @Override
    public <E extends RealmModel> E createDetachedCopy(E realmObject, int maxDepth, Map<RealmModel, RealmObjectProxy.CacheData<RealmModel>> cache) {
        // This cast is correct because obj is either
        // generated by RealmProxy or the original type extending directly from RealmObject
        @SuppressWarnings("unchecked") Class<E> clazz = (Class<E>) realmObject.getClass().getSuperclass();

        if (clazz.equals(com.ninespartans.xmanager.model.ProgramData.class)) {
            return clazz.cast(io.realm.com_ninespartans_xmanager_model_ProgramDataRealmProxy.createDetachedCopy((com.ninespartans.xmanager.model.ProgramData) realmObject, 0, maxDepth, cache));
        }
        if (clazz.equals(com.ninespartans.xmanager.model.DeviceProgram.class)) {
            return clazz.cast(io.realm.com_ninespartans_xmanager_model_DeviceProgramRealmProxy.createDetachedCopy((com.ninespartans.xmanager.model.DeviceProgram) realmObject, 0, maxDepth, cache));
        }
        if (clazz.equals(com.ninespartans.xmanager.model.User.class)) {
            return clazz.cast(io.realm.com_ninespartans_xmanager_model_UserRealmProxy.createDetachedCopy((com.ninespartans.xmanager.model.User) realmObject, 0, maxDepth, cache));
        }
        if (clazz.equals(com.ninespartans.xmanager.model.Account.class)) {
            return clazz.cast(io.realm.com_ninespartans_xmanager_model_AccountRealmProxy.createDetachedCopy((com.ninespartans.xmanager.model.Account) realmObject, 0, maxDepth, cache));
        }
        if (clazz.equals(com.ninespartans.xmanager.model.Device.class)) {
            return clazz.cast(io.realm.com_ninespartans_xmanager_model_DeviceRealmProxy.createDetachedCopy((com.ninespartans.xmanager.model.Device) realmObject, 0, maxDepth, cache));
        }
        throw getMissingProxyClassException(clazz);
    }

    @Override
    public <E extends RealmModel> boolean isEmbedded(Class<E> clazz) {
        if (clazz.equals(com.ninespartans.xmanager.model.ProgramData.class)) {
            return true;
        }
        if (clazz.equals(com.ninespartans.xmanager.model.DeviceProgram.class)) {
            return false;
        }
        if (clazz.equals(com.ninespartans.xmanager.model.User.class)) {
            return false;
        }
        if (clazz.equals(com.ninespartans.xmanager.model.Account.class)) {
            return false;
        }
        if (clazz.equals(com.ninespartans.xmanager.model.Device.class)) {
            return false;
        }
        throw getMissingProxyClassException(clazz);
    }

    @Override
    public <E extends RealmModel> void updateEmbeddedObject(Realm realm, E unmanagedObject, E managedObject, Map<RealmModel, RealmObjectProxy> cache, Set<ImportFlag> flags) {
        // This cast is correct because obj is either
        // generated by RealmProxy or the original type extending directly from RealmObject
        @SuppressWarnings("unchecked") Class<E> clazz = (Class<E>) managedObject.getClass().getSuperclass();

        if (clazz.equals(com.ninespartans.xmanager.model.ProgramData.class)) {
            io.realm.com_ninespartans_xmanager_model_ProgramDataRealmProxy.updateEmbeddedObject(realm, (com.ninespartans.xmanager.model.ProgramData) unmanagedObject, (com.ninespartans.xmanager.model.ProgramData) managedObject, cache, flags);
        } else if (clazz.equals(com.ninespartans.xmanager.model.DeviceProgram.class)) {
            throw getNotEmbeddedClassException("com.ninespartans.xmanager.model.DeviceProgram");
        } else if (clazz.equals(com.ninespartans.xmanager.model.User.class)) {
            throw getNotEmbeddedClassException("com.ninespartans.xmanager.model.User");
        } else if (clazz.equals(com.ninespartans.xmanager.model.Account.class)) {
            throw getNotEmbeddedClassException("com.ninespartans.xmanager.model.Account");
        } else if (clazz.equals(com.ninespartans.xmanager.model.Device.class)) {
            throw getNotEmbeddedClassException("com.ninespartans.xmanager.model.Device");
        } else {
            throw getMissingProxyClassException(clazz);
        }
    }

}
