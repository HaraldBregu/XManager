package io.realm;


import android.annotation.TargetApi;
import android.os.Build;
import android.util.JsonReader;
import android.util.JsonToken;
import io.realm.ImportFlag;
import io.realm.ProxyUtils;
import io.realm.exceptions.RealmMigrationNeededException;
import io.realm.internal.ColumnInfo;
import io.realm.internal.NativeContext;
import io.realm.internal.OsList;
import io.realm.internal.OsMap;
import io.realm.internal.OsObject;
import io.realm.internal.OsObjectSchemaInfo;
import io.realm.internal.OsSchemaInfo;
import io.realm.internal.OsSet;
import io.realm.internal.Property;
import io.realm.internal.RealmObjectProxy;
import io.realm.internal.Row;
import io.realm.internal.Table;
import io.realm.internal.android.JsonUtils;
import io.realm.internal.core.NativeRealmAny;
import io.realm.internal.objectstore.OsObjectBuilder;
import io.realm.log.RealmLog;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@SuppressWarnings("all")
public class it_ninespartans_xmanager_model_PlayerRealmProxy extends it.ninespartans.xmanager.model.Player
    implements RealmObjectProxy, it_ninespartans_xmanager_model_PlayerRealmProxyInterface {

    static final class PlayerColumnInfo extends ColumnInfo {
        long idColKey;
        long fullnameColKey;
        long roleColKey;
        long ageColKey;
        long leftDeviceColKey;
        long rightDeviceColKey;
        long sessionProgramColKey;
        long activeColKey;

        PlayerColumnInfo(OsSchemaInfo schemaInfo) {
            super(8);
            OsObjectSchemaInfo objectSchemaInfo = schemaInfo.getObjectSchemaInfo("Player");
            this.idColKey = addColumnDetails("id", "id", objectSchemaInfo);
            this.fullnameColKey = addColumnDetails("fullname", "fullname", objectSchemaInfo);
            this.roleColKey = addColumnDetails("role", "role", objectSchemaInfo);
            this.ageColKey = addColumnDetails("age", "age", objectSchemaInfo);
            this.leftDeviceColKey = addColumnDetails("leftDevice", "leftDevice", objectSchemaInfo);
            this.rightDeviceColKey = addColumnDetails("rightDevice", "rightDevice", objectSchemaInfo);
            this.sessionProgramColKey = addColumnDetails("sessionProgram", "sessionProgram", objectSchemaInfo);
            this.activeColKey = addColumnDetails("active", "active", objectSchemaInfo);
        }

        PlayerColumnInfo(ColumnInfo src, boolean mutable) {
            super(src, mutable);
            copy(src, this);
        }

        @Override
        protected final ColumnInfo copy(boolean mutable) {
            return new PlayerColumnInfo(this, mutable);
        }

        @Override
        protected final void copy(ColumnInfo rawSrc, ColumnInfo rawDst) {
            final PlayerColumnInfo src = (PlayerColumnInfo) rawSrc;
            final PlayerColumnInfo dst = (PlayerColumnInfo) rawDst;
            dst.idColKey = src.idColKey;
            dst.fullnameColKey = src.fullnameColKey;
            dst.roleColKey = src.roleColKey;
            dst.ageColKey = src.ageColKey;
            dst.leftDeviceColKey = src.leftDeviceColKey;
            dst.rightDeviceColKey = src.rightDeviceColKey;
            dst.sessionProgramColKey = src.sessionProgramColKey;
            dst.activeColKey = src.activeColKey;
        }
    }

    private static final String NO_ALIAS = "";
    private static final OsObjectSchemaInfo expectedObjectSchemaInfo = createExpectedObjectSchemaInfo();

    private PlayerColumnInfo columnInfo;
    private ProxyState<it.ninespartans.xmanager.model.Player> proxyState;

    it_ninespartans_xmanager_model_PlayerRealmProxy() {
        proxyState.setConstructionFinished();
    }

    @Override
    public void realm$injectObjectContext() {
        if (this.proxyState != null) {
            return;
        }
        final BaseRealm.RealmObjectContext context = BaseRealm.objectContext.get();
        this.columnInfo = (PlayerColumnInfo) context.getColumnInfo();
        this.proxyState = new ProxyState<it.ninespartans.xmanager.model.Player>(this);
        proxyState.setRealm$realm(context.getRealm());
        proxyState.setRow$realm(context.getRow());
        proxyState.setAcceptDefaultValue$realm(context.getAcceptDefaultValue());
        proxyState.setExcludeFields$realm(context.getExcludeFields());
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$id() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.idColKey);
    }

    @Override
    public void realmSet$id(String value) {
        if (proxyState.isUnderConstruction()) {
            // default value of the primary key is always ignored.
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        throw new io.realm.exceptions.RealmException("Primary key field 'id' cannot be changed after object was created.");
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$fullname() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.fullnameColKey);
    }

    @Override
    public void realmSet$fullname(String value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'fullname' to null.");
            }
            row.getTable().setString(columnInfo.fullnameColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'fullname' to null.");
        }
        proxyState.getRow$realm().setString(columnInfo.fullnameColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$role() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.roleColKey);
    }

    @Override
    public void realmSet$role(String value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'role' to null.");
            }
            row.getTable().setString(columnInfo.roleColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'role' to null.");
        }
        proxyState.getRow$realm().setString(columnInfo.roleColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$age() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.ageColKey);
    }

    @Override
    public void realmSet$age(String value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'age' to null.");
            }
            row.getTable().setString(columnInfo.ageColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'age' to null.");
        }
        proxyState.getRow$realm().setString(columnInfo.ageColKey, value);
    }

    @Override
    public it.ninespartans.xmanager.model.Device realmGet$leftDevice() {
        proxyState.getRealm$realm().checkIfValid();
        if (proxyState.getRow$realm().isNullLink(columnInfo.leftDeviceColKey)) {
            return null;
        }
        return proxyState.getRealm$realm().get(it.ninespartans.xmanager.model.Device.class, proxyState.getRow$realm().getLink(columnInfo.leftDeviceColKey), false, Collections.<String>emptyList());
    }

    @Override
    public void realmSet$leftDevice(it.ninespartans.xmanager.model.Device value) {
        Realm realm = (Realm) proxyState.getRealm$realm();
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            if (proxyState.getExcludeFields$realm().contains("leftDevice")) {
                return;
            }
            if (value != null && !RealmObject.isManaged(value)) {
                value = realm.copyToRealmOrUpdate(value);
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                // Table#nullifyLink() does not support default value. Just using Row.
                row.nullifyLink(columnInfo.leftDeviceColKey);
                return;
            }
            proxyState.checkValidObject(value);
            row.getTable().setLink(columnInfo.leftDeviceColKey, row.getObjectKey(), ((RealmObjectProxy) value).realmGet$proxyState().getRow$realm().getObjectKey(), true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            proxyState.getRow$realm().nullifyLink(columnInfo.leftDeviceColKey);
            return;
        }
        proxyState.checkValidObject(value);
        proxyState.getRow$realm().setLink(columnInfo.leftDeviceColKey, ((RealmObjectProxy) value).realmGet$proxyState().getRow$realm().getObjectKey());
    }

    @Override
    public it.ninespartans.xmanager.model.Device realmGet$rightDevice() {
        proxyState.getRealm$realm().checkIfValid();
        if (proxyState.getRow$realm().isNullLink(columnInfo.rightDeviceColKey)) {
            return null;
        }
        return proxyState.getRealm$realm().get(it.ninespartans.xmanager.model.Device.class, proxyState.getRow$realm().getLink(columnInfo.rightDeviceColKey), false, Collections.<String>emptyList());
    }

    @Override
    public void realmSet$rightDevice(it.ninespartans.xmanager.model.Device value) {
        Realm realm = (Realm) proxyState.getRealm$realm();
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            if (proxyState.getExcludeFields$realm().contains("rightDevice")) {
                return;
            }
            if (value != null && !RealmObject.isManaged(value)) {
                value = realm.copyToRealmOrUpdate(value);
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                // Table#nullifyLink() does not support default value. Just using Row.
                row.nullifyLink(columnInfo.rightDeviceColKey);
                return;
            }
            proxyState.checkValidObject(value);
            row.getTable().setLink(columnInfo.rightDeviceColKey, row.getObjectKey(), ((RealmObjectProxy) value).realmGet$proxyState().getRow$realm().getObjectKey(), true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            proxyState.getRow$realm().nullifyLink(columnInfo.rightDeviceColKey);
            return;
        }
        proxyState.checkValidObject(value);
        proxyState.getRow$realm().setLink(columnInfo.rightDeviceColKey, ((RealmObjectProxy) value).realmGet$proxyState().getRow$realm().getObjectKey());
    }

    @Override
    public it.ninespartans.xmanager.model.TrainingSessionProgram realmGet$sessionProgram() {
        proxyState.getRealm$realm().checkIfValid();
        if (proxyState.getRow$realm().isNullLink(columnInfo.sessionProgramColKey)) {
            return null;
        }
        return proxyState.getRealm$realm().get(it.ninespartans.xmanager.model.TrainingSessionProgram.class, proxyState.getRow$realm().getLink(columnInfo.sessionProgramColKey), false, Collections.<String>emptyList());
    }

    @Override
    public void realmSet$sessionProgram(it.ninespartans.xmanager.model.TrainingSessionProgram value) {
        Realm realm = (Realm) proxyState.getRealm$realm();
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            if (proxyState.getExcludeFields$realm().contains("sessionProgram")) {
                return;
            }
            if (value != null && !RealmObject.isManaged(value)) {
                value = realm.copyToRealmOrUpdate(value);
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                // Table#nullifyLink() does not support default value. Just using Row.
                row.nullifyLink(columnInfo.sessionProgramColKey);
                return;
            }
            proxyState.checkValidObject(value);
            row.getTable().setLink(columnInfo.sessionProgramColKey, row.getObjectKey(), ((RealmObjectProxy) value).realmGet$proxyState().getRow$realm().getObjectKey(), true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            proxyState.getRow$realm().nullifyLink(columnInfo.sessionProgramColKey);
            return;
        }
        proxyState.checkValidObject(value);
        proxyState.getRow$realm().setLink(columnInfo.sessionProgramColKey, ((RealmObjectProxy) value).realmGet$proxyState().getRow$realm().getObjectKey());
    }

    @Override
    @SuppressWarnings("cast")
    public boolean realmGet$active() {
        proxyState.getRealm$realm().checkIfValid();
        return (boolean) proxyState.getRow$realm().getBoolean(columnInfo.activeColKey);
    }

    @Override
    public void realmSet$active(boolean value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            row.getTable().setBoolean(columnInfo.activeColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        proxyState.getRow$realm().setBoolean(columnInfo.activeColKey, value);
    }

    private static OsObjectSchemaInfo createExpectedObjectSchemaInfo() {
        OsObjectSchemaInfo.Builder builder = new OsObjectSchemaInfo.Builder(NO_ALIAS, "Player", false, 8, 0);
        builder.addPersistedProperty(NO_ALIAS, "id", RealmFieldType.STRING, Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "fullname", RealmFieldType.STRING, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "role", RealmFieldType.STRING, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "age", RealmFieldType.STRING, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedLinkProperty(NO_ALIAS, "leftDevice", RealmFieldType.OBJECT, "Device");
        builder.addPersistedLinkProperty(NO_ALIAS, "rightDevice", RealmFieldType.OBJECT, "Device");
        builder.addPersistedLinkProperty(NO_ALIAS, "sessionProgram", RealmFieldType.OBJECT, "TrainingSessionProgram");
        builder.addPersistedProperty(NO_ALIAS, "active", RealmFieldType.BOOLEAN, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        return builder.build();
    }

    public static OsObjectSchemaInfo getExpectedObjectSchemaInfo() {
        return expectedObjectSchemaInfo;
    }

    public static PlayerColumnInfo createColumnInfo(OsSchemaInfo schemaInfo) {
        return new PlayerColumnInfo(schemaInfo);
    }

    public static String getSimpleClassName() {
        return "Player";
    }

    public static final class ClassNameHelper {
        public static final String INTERNAL_CLASS_NAME = "Player";
    }

    @SuppressWarnings("cast")
    public static it.ninespartans.xmanager.model.Player createOrUpdateUsingJsonObject(Realm realm, JSONObject json, boolean update)
        throws JSONException {
        final List<String> excludeFields = new ArrayList<String>(3);
        it.ninespartans.xmanager.model.Player obj = null;
        if (update) {
            Table table = realm.getTable(it.ninespartans.xmanager.model.Player.class);
            PlayerColumnInfo columnInfo = (PlayerColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Player.class);
            long pkColumnKey = columnInfo.idColKey;
            long objKey = Table.NO_MATCH;
            if (!json.isNull("id")) {
                objKey = table.findFirstString(pkColumnKey, json.getString("id"));
            }
            if (objKey != Table.NO_MATCH) {
                final BaseRealm.RealmObjectContext objectContext = BaseRealm.objectContext.get();
                try {
                    objectContext.set(realm, table.getUncheckedRow(objKey), realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Player.class), false, Collections.<String> emptyList());
                    obj = new io.realm.it_ninespartans_xmanager_model_PlayerRealmProxy();
                } finally {
                    objectContext.clear();
                }
            }
        }
        if (obj == null) {
            if (json.has("leftDevice")) {
                excludeFields.add("leftDevice");
            }
            if (json.has("rightDevice")) {
                excludeFields.add("rightDevice");
            }
            if (json.has("sessionProgram")) {
                excludeFields.add("sessionProgram");
            }
            if (json.has("id")) {
                if (json.isNull("id")) {
                    obj = (io.realm.it_ninespartans_xmanager_model_PlayerRealmProxy) realm.createObjectInternal(it.ninespartans.xmanager.model.Player.class, null, true, excludeFields);
                } else {
                    obj = (io.realm.it_ninespartans_xmanager_model_PlayerRealmProxy) realm.createObjectInternal(it.ninespartans.xmanager.model.Player.class, json.getString("id"), true, excludeFields);
                }
            } else {
                throw new IllegalArgumentException("JSON object doesn't have the primary key field 'id'.");
            }
        }

        final it_ninespartans_xmanager_model_PlayerRealmProxyInterface objProxy = (it_ninespartans_xmanager_model_PlayerRealmProxyInterface) obj;
        if (json.has("fullname")) {
            if (json.isNull("fullname")) {
                objProxy.realmSet$fullname(null);
            } else {
                objProxy.realmSet$fullname((String) json.getString("fullname"));
            }
        }
        if (json.has("role")) {
            if (json.isNull("role")) {
                objProxy.realmSet$role(null);
            } else {
                objProxy.realmSet$role((String) json.getString("role"));
            }
        }
        if (json.has("age")) {
            if (json.isNull("age")) {
                objProxy.realmSet$age(null);
            } else {
                objProxy.realmSet$age((String) json.getString("age"));
            }
        }
        if (json.has("leftDevice")) {
            if (json.isNull("leftDevice")) {
                objProxy.realmSet$leftDevice(null);
            } else {
                it.ninespartans.xmanager.model.Device leftDeviceObj = it_ninespartans_xmanager_model_DeviceRealmProxy.createOrUpdateUsingJsonObject(realm, json.getJSONObject("leftDevice"), update);
                objProxy.realmSet$leftDevice(leftDeviceObj);
            }
        }
        if (json.has("rightDevice")) {
            if (json.isNull("rightDevice")) {
                objProxy.realmSet$rightDevice(null);
            } else {
                it.ninespartans.xmanager.model.Device rightDeviceObj = it_ninespartans_xmanager_model_DeviceRealmProxy.createOrUpdateUsingJsonObject(realm, json.getJSONObject("rightDevice"), update);
                objProxy.realmSet$rightDevice(rightDeviceObj);
            }
        }
        if (json.has("sessionProgram")) {
            if (json.isNull("sessionProgram")) {
                objProxy.realmSet$sessionProgram(null);
            } else {
                it.ninespartans.xmanager.model.TrainingSessionProgram sessionProgramObj = it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy.createOrUpdateUsingJsonObject(realm, json.getJSONObject("sessionProgram"), update);
                objProxy.realmSet$sessionProgram(sessionProgramObj);
            }
        }
        if (json.has("active")) {
            if (json.isNull("active")) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'active' to null.");
            } else {
                objProxy.realmSet$active((boolean) json.getBoolean("active"));
            }
        }
        return obj;
    }

    @SuppressWarnings("cast")
    @TargetApi(Build.VERSION_CODES.HONEYCOMB)
    public static it.ninespartans.xmanager.model.Player createUsingJsonStream(Realm realm, JsonReader reader)
        throws IOException {
        boolean jsonHasPrimaryKey = false;
        final it.ninespartans.xmanager.model.Player obj = new it.ninespartans.xmanager.model.Player();
        final it_ninespartans_xmanager_model_PlayerRealmProxyInterface objProxy = (it_ninespartans_xmanager_model_PlayerRealmProxyInterface) obj;
        reader.beginObject();
        while (reader.hasNext()) {
            String name = reader.nextName();
            if (false) {
            } else if (name.equals("id")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$id((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$id(null);
                }
                jsonHasPrimaryKey = true;
            } else if (name.equals("fullname")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$fullname((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$fullname(null);
                }
            } else if (name.equals("role")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$role((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$role(null);
                }
            } else if (name.equals("age")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$age((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$age(null);
                }
            } else if (name.equals("leftDevice")) {
                if (reader.peek() == JsonToken.NULL) {
                    reader.skipValue();
                    objProxy.realmSet$leftDevice(null);
                } else {
                    it.ninespartans.xmanager.model.Device leftDeviceObj = it_ninespartans_xmanager_model_DeviceRealmProxy.createUsingJsonStream(realm, reader);
                    objProxy.realmSet$leftDevice(leftDeviceObj);
                }
            } else if (name.equals("rightDevice")) {
                if (reader.peek() == JsonToken.NULL) {
                    reader.skipValue();
                    objProxy.realmSet$rightDevice(null);
                } else {
                    it.ninespartans.xmanager.model.Device rightDeviceObj = it_ninespartans_xmanager_model_DeviceRealmProxy.createUsingJsonStream(realm, reader);
                    objProxy.realmSet$rightDevice(rightDeviceObj);
                }
            } else if (name.equals("sessionProgram")) {
                if (reader.peek() == JsonToken.NULL) {
                    reader.skipValue();
                    objProxy.realmSet$sessionProgram(null);
                } else {
                    it.ninespartans.xmanager.model.TrainingSessionProgram sessionProgramObj = it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy.createUsingJsonStream(realm, reader);
                    objProxy.realmSet$sessionProgram(sessionProgramObj);
                }
            } else if (name.equals("active")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$active((boolean) reader.nextBoolean());
                } else {
                    reader.skipValue();
                    throw new IllegalArgumentException("Trying to set non-nullable field 'active' to null.");
                }
            } else {
                reader.skipValue();
            }
        }
        reader.endObject();
        if (!jsonHasPrimaryKey) {
            throw new IllegalArgumentException("JSON object doesn't have the primary key field 'id'.");
        }
        return realm.copyToRealmOrUpdate(obj);
    }

    static it_ninespartans_xmanager_model_PlayerRealmProxy newProxyInstance(BaseRealm realm, Row row) {
        // Ignore default values to avoid creating unexpected objects from RealmModel/RealmList fields
        final BaseRealm.RealmObjectContext objectContext = BaseRealm.objectContext.get();
        objectContext.set(realm, row, realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Player.class), false, Collections.<String>emptyList());
        io.realm.it_ninespartans_xmanager_model_PlayerRealmProxy obj = new io.realm.it_ninespartans_xmanager_model_PlayerRealmProxy();
        objectContext.clear();
        return obj;
    }

    public static it.ninespartans.xmanager.model.Player copyOrUpdate(Realm realm, PlayerColumnInfo columnInfo, it.ninespartans.xmanager.model.Player object, boolean update, Map<RealmModel,RealmObjectProxy> cache, Set<ImportFlag> flags) {
        if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null) {
            final BaseRealm otherRealm = ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm();
            if (otherRealm.threadId != realm.threadId) {
                throw new IllegalArgumentException("Objects which belong to Realm instances in other threads cannot be copied into this Realm instance.");
            }
            if (otherRealm.getPath().equals(realm.getPath())) {
                return object;
            }
        }
        final BaseRealm.RealmObjectContext objectContext = BaseRealm.objectContext.get();
        RealmObjectProxy cachedRealmObject = cache.get(object);
        if (cachedRealmObject != null) {
            return (it.ninespartans.xmanager.model.Player) cachedRealmObject;
        }

        it.ninespartans.xmanager.model.Player realmObject = null;
        boolean canUpdate = update;
        if (canUpdate) {
            Table table = realm.getTable(it.ninespartans.xmanager.model.Player.class);
            long pkColumnKey = columnInfo.idColKey;
            long objKey = table.findFirstString(pkColumnKey, ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$id());
            if (objKey == Table.NO_MATCH) {
                canUpdate = false;
            } else {
                try {
                    objectContext.set(realm, table.getUncheckedRow(objKey), columnInfo, false, Collections.<String> emptyList());
                    realmObject = new io.realm.it_ninespartans_xmanager_model_PlayerRealmProxy();
                    cache.put(object, (RealmObjectProxy) realmObject);
                } finally {
                    objectContext.clear();
                }
            }
        }

        return (canUpdate) ? update(realm, columnInfo, realmObject, object, cache, flags) : copy(realm, columnInfo, object, update, cache, flags);
    }

    public static it.ninespartans.xmanager.model.Player copy(Realm realm, PlayerColumnInfo columnInfo, it.ninespartans.xmanager.model.Player newObject, boolean update, Map<RealmModel,RealmObjectProxy> cache, Set<ImportFlag> flags) {
        RealmObjectProxy cachedRealmObject = cache.get(newObject);
        if (cachedRealmObject != null) {
            return (it.ninespartans.xmanager.model.Player) cachedRealmObject;
        }

        it_ninespartans_xmanager_model_PlayerRealmProxyInterface unmanagedSource = (it_ninespartans_xmanager_model_PlayerRealmProxyInterface) newObject;

        Table table = realm.getTable(it.ninespartans.xmanager.model.Player.class);
        OsObjectBuilder builder = new OsObjectBuilder(table, flags);

        // Add all non-"object reference" fields
        builder.addString(columnInfo.idColKey, unmanagedSource.realmGet$id());
        builder.addString(columnInfo.fullnameColKey, unmanagedSource.realmGet$fullname());
        builder.addString(columnInfo.roleColKey, unmanagedSource.realmGet$role());
        builder.addString(columnInfo.ageColKey, unmanagedSource.realmGet$age());
        builder.addBoolean(columnInfo.activeColKey, unmanagedSource.realmGet$active());

        // Create the underlying object and cache it before setting any object/objectlist references
        // This will allow us to break any circular dependencies by using the object cache.
        Row row = builder.createNewObject();
        io.realm.it_ninespartans_xmanager_model_PlayerRealmProxy managedCopy = newProxyInstance(realm, row);
        cache.put(newObject, managedCopy);

        // Finally add all fields that reference other Realm Objects, either directly or through a list
        it.ninespartans.xmanager.model.Device leftDeviceObj = unmanagedSource.realmGet$leftDevice();
        if (leftDeviceObj == null) {
            managedCopy.realmSet$leftDevice(null);
        } else {
            it.ninespartans.xmanager.model.Device cacheleftDevice = (it.ninespartans.xmanager.model.Device) cache.get(leftDeviceObj);
            if (cacheleftDevice != null) {
                managedCopy.realmSet$leftDevice(cacheleftDevice);
            } else {
                managedCopy.realmSet$leftDevice(it_ninespartans_xmanager_model_DeviceRealmProxy.copyOrUpdate(realm, (it_ninespartans_xmanager_model_DeviceRealmProxy.DeviceColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Device.class), leftDeviceObj, update, cache, flags));
            }
        }

        it.ninespartans.xmanager.model.Device rightDeviceObj = unmanagedSource.realmGet$rightDevice();
        if (rightDeviceObj == null) {
            managedCopy.realmSet$rightDevice(null);
        } else {
            it.ninespartans.xmanager.model.Device cacherightDevice = (it.ninespartans.xmanager.model.Device) cache.get(rightDeviceObj);
            if (cacherightDevice != null) {
                managedCopy.realmSet$rightDevice(cacherightDevice);
            } else {
                managedCopy.realmSet$rightDevice(it_ninespartans_xmanager_model_DeviceRealmProxy.copyOrUpdate(realm, (it_ninespartans_xmanager_model_DeviceRealmProxy.DeviceColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Device.class), rightDeviceObj, update, cache, flags));
            }
        }

        it.ninespartans.xmanager.model.TrainingSessionProgram sessionProgramObj = unmanagedSource.realmGet$sessionProgram();
        if (sessionProgramObj == null) {
            managedCopy.realmSet$sessionProgram(null);
        } else {
            it.ninespartans.xmanager.model.TrainingSessionProgram cachesessionProgram = (it.ninespartans.xmanager.model.TrainingSessionProgram) cache.get(sessionProgramObj);
            if (cachesessionProgram != null) {
                managedCopy.realmSet$sessionProgram(cachesessionProgram);
            } else {
                managedCopy.realmSet$sessionProgram(it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy.copyOrUpdate(realm, (it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy.TrainingSessionProgramColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.TrainingSessionProgram.class), sessionProgramObj, update, cache, flags));
            }
        }

        return managedCopy;
    }

    public static long insert(Realm realm, it.ninespartans.xmanager.model.Player object, Map<RealmModel,Long> cache) {
        if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
            return ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey();
        }
        Table table = realm.getTable(it.ninespartans.xmanager.model.Player.class);
        long tableNativePtr = table.getNativePtr();
        PlayerColumnInfo columnInfo = (PlayerColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Player.class);
        long pkColumnKey = columnInfo.idColKey;
        long objKey = Table.NO_MATCH;
        Object primaryKeyValue = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$id();
        if (primaryKeyValue != null) {
            objKey = Table.nativeFindFirstString(tableNativePtr, pkColumnKey, (String)primaryKeyValue);
        }
        if (objKey == Table.NO_MATCH) {
            objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
        } else {
            Table.throwDuplicatePrimaryKeyException(primaryKeyValue);
        }
        cache.put(object, objKey);
        String realmGet$fullname = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$fullname();
        if (realmGet$fullname != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.fullnameColKey, objKey, realmGet$fullname, false);
        }
        String realmGet$role = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$role();
        if (realmGet$role != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.roleColKey, objKey, realmGet$role, false);
        }
        String realmGet$age = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$age();
        if (realmGet$age != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.ageColKey, objKey, realmGet$age, false);
        }

        it.ninespartans.xmanager.model.Device leftDeviceObj = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$leftDevice();
        if (leftDeviceObj != null) {
            Long cacheleftDevice = cache.get(leftDeviceObj);
            if (cacheleftDevice == null) {
                cacheleftDevice = it_ninespartans_xmanager_model_DeviceRealmProxy.insert(realm, leftDeviceObj, cache);
            }
            Table.nativeSetLink(tableNativePtr, columnInfo.leftDeviceColKey, objKey, cacheleftDevice, false);
        }

        it.ninespartans.xmanager.model.Device rightDeviceObj = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$rightDevice();
        if (rightDeviceObj != null) {
            Long cacherightDevice = cache.get(rightDeviceObj);
            if (cacherightDevice == null) {
                cacherightDevice = it_ninespartans_xmanager_model_DeviceRealmProxy.insert(realm, rightDeviceObj, cache);
            }
            Table.nativeSetLink(tableNativePtr, columnInfo.rightDeviceColKey, objKey, cacherightDevice, false);
        }

        it.ninespartans.xmanager.model.TrainingSessionProgram sessionProgramObj = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$sessionProgram();
        if (sessionProgramObj != null) {
            Long cachesessionProgram = cache.get(sessionProgramObj);
            if (cachesessionProgram == null) {
                cachesessionProgram = it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy.insert(realm, sessionProgramObj, cache);
            }
            Table.nativeSetLink(tableNativePtr, columnInfo.sessionProgramColKey, objKey, cachesessionProgram, false);
        }
        Table.nativeSetBoolean(tableNativePtr, columnInfo.activeColKey, objKey, ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$active(), false);
        return objKey;
    }

    public static void insert(Realm realm, Iterator<? extends RealmModel> objects, Map<RealmModel,Long> cache) {
        Table table = realm.getTable(it.ninespartans.xmanager.model.Player.class);
        long tableNativePtr = table.getNativePtr();
        PlayerColumnInfo columnInfo = (PlayerColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Player.class);
        long pkColumnKey = columnInfo.idColKey;
        it.ninespartans.xmanager.model.Player object = null;
        while (objects.hasNext()) {
            object = (it.ninespartans.xmanager.model.Player) objects.next();
            if (cache.containsKey(object)) {
                continue;
            }
            if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
                cache.put(object, ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey());
                continue;
            }
            long objKey = Table.NO_MATCH;
            Object primaryKeyValue = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$id();
            if (primaryKeyValue != null) {
                objKey = Table.nativeFindFirstString(tableNativePtr, pkColumnKey, (String)primaryKeyValue);
            }
            if (objKey == Table.NO_MATCH) {
                objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
            } else {
                Table.throwDuplicatePrimaryKeyException(primaryKeyValue);
            }
            cache.put(object, objKey);
            String realmGet$fullname = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$fullname();
            if (realmGet$fullname != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.fullnameColKey, objKey, realmGet$fullname, false);
            }
            String realmGet$role = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$role();
            if (realmGet$role != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.roleColKey, objKey, realmGet$role, false);
            }
            String realmGet$age = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$age();
            if (realmGet$age != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.ageColKey, objKey, realmGet$age, false);
            }

            it.ninespartans.xmanager.model.Device leftDeviceObj = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$leftDevice();
            if (leftDeviceObj != null) {
                Long cacheleftDevice = cache.get(leftDeviceObj);
                if (cacheleftDevice == null) {
                    cacheleftDevice = it_ninespartans_xmanager_model_DeviceRealmProxy.insert(realm, leftDeviceObj, cache);
                }
                Table.nativeSetLink(tableNativePtr, columnInfo.leftDeviceColKey, objKey, cacheleftDevice, false);
            }

            it.ninespartans.xmanager.model.Device rightDeviceObj = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$rightDevice();
            if (rightDeviceObj != null) {
                Long cacherightDevice = cache.get(rightDeviceObj);
                if (cacherightDevice == null) {
                    cacherightDevice = it_ninespartans_xmanager_model_DeviceRealmProxy.insert(realm, rightDeviceObj, cache);
                }
                Table.nativeSetLink(tableNativePtr, columnInfo.rightDeviceColKey, objKey, cacherightDevice, false);
            }

            it.ninespartans.xmanager.model.TrainingSessionProgram sessionProgramObj = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$sessionProgram();
            if (sessionProgramObj != null) {
                Long cachesessionProgram = cache.get(sessionProgramObj);
                if (cachesessionProgram == null) {
                    cachesessionProgram = it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy.insert(realm, sessionProgramObj, cache);
                }
                Table.nativeSetLink(tableNativePtr, columnInfo.sessionProgramColKey, objKey, cachesessionProgram, false);
            }
            Table.nativeSetBoolean(tableNativePtr, columnInfo.activeColKey, objKey, ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$active(), false);
        }
    }

    public static long insertOrUpdate(Realm realm, it.ninespartans.xmanager.model.Player object, Map<RealmModel,Long> cache) {
        if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
            return ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey();
        }
        Table table = realm.getTable(it.ninespartans.xmanager.model.Player.class);
        long tableNativePtr = table.getNativePtr();
        PlayerColumnInfo columnInfo = (PlayerColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Player.class);
        long pkColumnKey = columnInfo.idColKey;
        long objKey = Table.NO_MATCH;
        Object primaryKeyValue = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$id();
        if (primaryKeyValue != null) {
            objKey = Table.nativeFindFirstString(tableNativePtr, pkColumnKey, (String)primaryKeyValue);
        }
        if (objKey == Table.NO_MATCH) {
            objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
        }
        cache.put(object, objKey);
        String realmGet$fullname = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$fullname();
        if (realmGet$fullname != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.fullnameColKey, objKey, realmGet$fullname, false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.fullnameColKey, objKey, false);
        }
        String realmGet$role = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$role();
        if (realmGet$role != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.roleColKey, objKey, realmGet$role, false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.roleColKey, objKey, false);
        }
        String realmGet$age = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$age();
        if (realmGet$age != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.ageColKey, objKey, realmGet$age, false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.ageColKey, objKey, false);
        }

        it.ninespartans.xmanager.model.Device leftDeviceObj = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$leftDevice();
        if (leftDeviceObj != null) {
            Long cacheleftDevice = cache.get(leftDeviceObj);
            if (cacheleftDevice == null) {
                cacheleftDevice = it_ninespartans_xmanager_model_DeviceRealmProxy.insertOrUpdate(realm, leftDeviceObj, cache);
            }
            Table.nativeSetLink(tableNativePtr, columnInfo.leftDeviceColKey, objKey, cacheleftDevice, false);
        } else {
            Table.nativeNullifyLink(tableNativePtr, columnInfo.leftDeviceColKey, objKey);
        }

        it.ninespartans.xmanager.model.Device rightDeviceObj = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$rightDevice();
        if (rightDeviceObj != null) {
            Long cacherightDevice = cache.get(rightDeviceObj);
            if (cacherightDevice == null) {
                cacherightDevice = it_ninespartans_xmanager_model_DeviceRealmProxy.insertOrUpdate(realm, rightDeviceObj, cache);
            }
            Table.nativeSetLink(tableNativePtr, columnInfo.rightDeviceColKey, objKey, cacherightDevice, false);
        } else {
            Table.nativeNullifyLink(tableNativePtr, columnInfo.rightDeviceColKey, objKey);
        }

        it.ninespartans.xmanager.model.TrainingSessionProgram sessionProgramObj = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$sessionProgram();
        if (sessionProgramObj != null) {
            Long cachesessionProgram = cache.get(sessionProgramObj);
            if (cachesessionProgram == null) {
                cachesessionProgram = it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy.insertOrUpdate(realm, sessionProgramObj, cache);
            }
            Table.nativeSetLink(tableNativePtr, columnInfo.sessionProgramColKey, objKey, cachesessionProgram, false);
        } else {
            Table.nativeNullifyLink(tableNativePtr, columnInfo.sessionProgramColKey, objKey);
        }
        Table.nativeSetBoolean(tableNativePtr, columnInfo.activeColKey, objKey, ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$active(), false);
        return objKey;
    }

    public static void insertOrUpdate(Realm realm, Iterator<? extends RealmModel> objects, Map<RealmModel,Long> cache) {
        Table table = realm.getTable(it.ninespartans.xmanager.model.Player.class);
        long tableNativePtr = table.getNativePtr();
        PlayerColumnInfo columnInfo = (PlayerColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Player.class);
        long pkColumnKey = columnInfo.idColKey;
        it.ninespartans.xmanager.model.Player object = null;
        while (objects.hasNext()) {
            object = (it.ninespartans.xmanager.model.Player) objects.next();
            if (cache.containsKey(object)) {
                continue;
            }
            if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
                cache.put(object, ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey());
                continue;
            }
            long objKey = Table.NO_MATCH;
            Object primaryKeyValue = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$id();
            if (primaryKeyValue != null) {
                objKey = Table.nativeFindFirstString(tableNativePtr, pkColumnKey, (String)primaryKeyValue);
            }
            if (objKey == Table.NO_MATCH) {
                objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
            }
            cache.put(object, objKey);
            String realmGet$fullname = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$fullname();
            if (realmGet$fullname != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.fullnameColKey, objKey, realmGet$fullname, false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.fullnameColKey, objKey, false);
            }
            String realmGet$role = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$role();
            if (realmGet$role != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.roleColKey, objKey, realmGet$role, false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.roleColKey, objKey, false);
            }
            String realmGet$age = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$age();
            if (realmGet$age != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.ageColKey, objKey, realmGet$age, false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.ageColKey, objKey, false);
            }

            it.ninespartans.xmanager.model.Device leftDeviceObj = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$leftDevice();
            if (leftDeviceObj != null) {
                Long cacheleftDevice = cache.get(leftDeviceObj);
                if (cacheleftDevice == null) {
                    cacheleftDevice = it_ninespartans_xmanager_model_DeviceRealmProxy.insertOrUpdate(realm, leftDeviceObj, cache);
                }
                Table.nativeSetLink(tableNativePtr, columnInfo.leftDeviceColKey, objKey, cacheleftDevice, false);
            } else {
                Table.nativeNullifyLink(tableNativePtr, columnInfo.leftDeviceColKey, objKey);
            }

            it.ninespartans.xmanager.model.Device rightDeviceObj = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$rightDevice();
            if (rightDeviceObj != null) {
                Long cacherightDevice = cache.get(rightDeviceObj);
                if (cacherightDevice == null) {
                    cacherightDevice = it_ninespartans_xmanager_model_DeviceRealmProxy.insertOrUpdate(realm, rightDeviceObj, cache);
                }
                Table.nativeSetLink(tableNativePtr, columnInfo.rightDeviceColKey, objKey, cacherightDevice, false);
            } else {
                Table.nativeNullifyLink(tableNativePtr, columnInfo.rightDeviceColKey, objKey);
            }

            it.ninespartans.xmanager.model.TrainingSessionProgram sessionProgramObj = ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$sessionProgram();
            if (sessionProgramObj != null) {
                Long cachesessionProgram = cache.get(sessionProgramObj);
                if (cachesessionProgram == null) {
                    cachesessionProgram = it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy.insertOrUpdate(realm, sessionProgramObj, cache);
                }
                Table.nativeSetLink(tableNativePtr, columnInfo.sessionProgramColKey, objKey, cachesessionProgram, false);
            } else {
                Table.nativeNullifyLink(tableNativePtr, columnInfo.sessionProgramColKey, objKey);
            }
            Table.nativeSetBoolean(tableNativePtr, columnInfo.activeColKey, objKey, ((it_ninespartans_xmanager_model_PlayerRealmProxyInterface) object).realmGet$active(), false);
        }
    }

    public static it.ninespartans.xmanager.model.Player createDetachedCopy(it.ninespartans.xmanager.model.Player realmObject, int currentDepth, int maxDepth, Map<RealmModel, CacheData<RealmModel>> cache) {
        if (currentDepth > maxDepth || realmObject == null) {
            return null;
        }
        CacheData<RealmModel> cachedObject = cache.get(realmObject);
        it.ninespartans.xmanager.model.Player unmanagedObject;
        if (cachedObject == null) {
            unmanagedObject = new it.ninespartans.xmanager.model.Player();
            cache.put(realmObject, new RealmObjectProxy.CacheData<RealmModel>(currentDepth, unmanagedObject));
        } else {
            // Reuse cached object or recreate it because it was encountered at a lower depth.
            if (currentDepth >= cachedObject.minDepth) {
                return (it.ninespartans.xmanager.model.Player) cachedObject.object;
            }
            unmanagedObject = (it.ninespartans.xmanager.model.Player) cachedObject.object;
            cachedObject.minDepth = currentDepth;
        }
        it_ninespartans_xmanager_model_PlayerRealmProxyInterface unmanagedCopy = (it_ninespartans_xmanager_model_PlayerRealmProxyInterface) unmanagedObject;
        it_ninespartans_xmanager_model_PlayerRealmProxyInterface realmSource = (it_ninespartans_xmanager_model_PlayerRealmProxyInterface) realmObject;
        Realm objectRealm = (Realm) ((RealmObjectProxy) realmObject).realmGet$proxyState().getRealm$realm();
        unmanagedCopy.realmSet$id(realmSource.realmGet$id());
        unmanagedCopy.realmSet$fullname(realmSource.realmGet$fullname());
        unmanagedCopy.realmSet$role(realmSource.realmGet$role());
        unmanagedCopy.realmSet$age(realmSource.realmGet$age());

        // Deep copy of leftDevice
        unmanagedCopy.realmSet$leftDevice(it_ninespartans_xmanager_model_DeviceRealmProxy.createDetachedCopy(realmSource.realmGet$leftDevice(), currentDepth + 1, maxDepth, cache));

        // Deep copy of rightDevice
        unmanagedCopy.realmSet$rightDevice(it_ninespartans_xmanager_model_DeviceRealmProxy.createDetachedCopy(realmSource.realmGet$rightDevice(), currentDepth + 1, maxDepth, cache));

        // Deep copy of sessionProgram
        unmanagedCopy.realmSet$sessionProgram(it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy.createDetachedCopy(realmSource.realmGet$sessionProgram(), currentDepth + 1, maxDepth, cache));
        unmanagedCopy.realmSet$active(realmSource.realmGet$active());

        return unmanagedObject;
    }

    static it.ninespartans.xmanager.model.Player update(Realm realm, PlayerColumnInfo columnInfo, it.ninespartans.xmanager.model.Player realmObject, it.ninespartans.xmanager.model.Player newObject, Map<RealmModel, RealmObjectProxy> cache, Set<ImportFlag> flags) {
        it_ninespartans_xmanager_model_PlayerRealmProxyInterface realmObjectTarget = (it_ninespartans_xmanager_model_PlayerRealmProxyInterface) realmObject;
        it_ninespartans_xmanager_model_PlayerRealmProxyInterface realmObjectSource = (it_ninespartans_xmanager_model_PlayerRealmProxyInterface) newObject;
        Table table = realm.getTable(it.ninespartans.xmanager.model.Player.class);
        OsObjectBuilder builder = new OsObjectBuilder(table, flags);
        builder.addString(columnInfo.idColKey, realmObjectSource.realmGet$id());
        builder.addString(columnInfo.fullnameColKey, realmObjectSource.realmGet$fullname());
        builder.addString(columnInfo.roleColKey, realmObjectSource.realmGet$role());
        builder.addString(columnInfo.ageColKey, realmObjectSource.realmGet$age());

        it.ninespartans.xmanager.model.Device leftDeviceObj = realmObjectSource.realmGet$leftDevice();
        if (leftDeviceObj == null) {
            builder.addNull(columnInfo.leftDeviceColKey);
        } else {
            it.ninespartans.xmanager.model.Device cacheleftDevice = (it.ninespartans.xmanager.model.Device) cache.get(leftDeviceObj);
            if (cacheleftDevice != null) {
                builder.addObject(columnInfo.leftDeviceColKey, cacheleftDevice);
            } else {
                builder.addObject(columnInfo.leftDeviceColKey, it_ninespartans_xmanager_model_DeviceRealmProxy.copyOrUpdate(realm, (it_ninespartans_xmanager_model_DeviceRealmProxy.DeviceColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Device.class), leftDeviceObj, true, cache, flags));
            }
        }

        it.ninespartans.xmanager.model.Device rightDeviceObj = realmObjectSource.realmGet$rightDevice();
        if (rightDeviceObj == null) {
            builder.addNull(columnInfo.rightDeviceColKey);
        } else {
            it.ninespartans.xmanager.model.Device cacherightDevice = (it.ninespartans.xmanager.model.Device) cache.get(rightDeviceObj);
            if (cacherightDevice != null) {
                builder.addObject(columnInfo.rightDeviceColKey, cacherightDevice);
            } else {
                builder.addObject(columnInfo.rightDeviceColKey, it_ninespartans_xmanager_model_DeviceRealmProxy.copyOrUpdate(realm, (it_ninespartans_xmanager_model_DeviceRealmProxy.DeviceColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Device.class), rightDeviceObj, true, cache, flags));
            }
        }

        it.ninespartans.xmanager.model.TrainingSessionProgram sessionProgramObj = realmObjectSource.realmGet$sessionProgram();
        if (sessionProgramObj == null) {
            builder.addNull(columnInfo.sessionProgramColKey);
        } else {
            it.ninespartans.xmanager.model.TrainingSessionProgram cachesessionProgram = (it.ninespartans.xmanager.model.TrainingSessionProgram) cache.get(sessionProgramObj);
            if (cachesessionProgram != null) {
                builder.addObject(columnInfo.sessionProgramColKey, cachesessionProgram);
            } else {
                builder.addObject(columnInfo.sessionProgramColKey, it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy.copyOrUpdate(realm, (it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy.TrainingSessionProgramColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.TrainingSessionProgram.class), sessionProgramObj, true, cache, flags));
            }
        }
        builder.addBoolean(columnInfo.activeColKey, realmObjectSource.realmGet$active());

        builder.updateExistingTopLevelObject();
        return realmObject;
    }

    @Override
    @SuppressWarnings("ArrayToString")
    public String toString() {
        if (!RealmObject.isValid(this)) {
            return "Invalid object";
        }
        StringBuilder stringBuilder = new StringBuilder("Player = proxy[");
        stringBuilder.append("{id:");
        stringBuilder.append(realmGet$id());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{fullname:");
        stringBuilder.append(realmGet$fullname());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{role:");
        stringBuilder.append(realmGet$role());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{age:");
        stringBuilder.append(realmGet$age());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{leftDevice:");
        stringBuilder.append(realmGet$leftDevice() != null ? "Device" : "null");
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{rightDevice:");
        stringBuilder.append(realmGet$rightDevice() != null ? "Device" : "null");
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{sessionProgram:");
        stringBuilder.append(realmGet$sessionProgram() != null ? "TrainingSessionProgram" : "null");
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{active:");
        stringBuilder.append(realmGet$active());
        stringBuilder.append("}");
        stringBuilder.append("]");
        return stringBuilder.toString();
    }

    @Override
    public ProxyState<?> realmGet$proxyState() {
        return proxyState;
    }

    @Override
    public int hashCode() {
        String realmName = proxyState.getRealm$realm().getPath();
        String tableName = proxyState.getRow$realm().getTable().getName();
        long objKey = proxyState.getRow$realm().getObjectKey();

        int result = 17;
        result = 31 * result + ((realmName != null) ? realmName.hashCode() : 0);
        result = 31 * result + ((tableName != null) ? tableName.hashCode() : 0);
        result = 31 * result + (int) (objKey ^ (objKey >>> 32));
        return result;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        it_ninespartans_xmanager_model_PlayerRealmProxy aPlayer = (it_ninespartans_xmanager_model_PlayerRealmProxy)o;

        BaseRealm realm = proxyState.getRealm$realm();
        BaseRealm otherRealm = aPlayer.proxyState.getRealm$realm();
        String path = realm.getPath();
        String otherPath = otherRealm.getPath();
        if (path != null ? !path.equals(otherPath) : otherPath != null) return false;
        if (realm.isFrozen() != otherRealm.isFrozen()) return false;
        if (!realm.sharedRealm.getVersionID().equals(otherRealm.sharedRealm.getVersionID())) {
            return false;
        }

        String tableName = proxyState.getRow$realm().getTable().getName();
        String otherTableName = aPlayer.proxyState.getRow$realm().getTable().getName();
        if (tableName != null ? !tableName.equals(otherTableName) : otherTableName != null) return false;

        if (proxyState.getRow$realm().getObjectKey() != aPlayer.proxyState.getRow$realm().getObjectKey()) return false;

        return true;
    }
}
