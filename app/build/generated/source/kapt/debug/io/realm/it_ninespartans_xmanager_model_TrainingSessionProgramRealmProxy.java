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
public class it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy extends it.ninespartans.xmanager.model.TrainingSessionProgram
    implements RealmObjectProxy, it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface {

    static final class TrainingSessionProgramColumnInfo extends ColumnInfo {
        long idColKey;
        long titleColKey;
        long descriptionColKey;
        long programListColKey;
        long startDateColKey;
        long activeColKey;

        TrainingSessionProgramColumnInfo(OsSchemaInfo schemaInfo) {
            super(6);
            OsObjectSchemaInfo objectSchemaInfo = schemaInfo.getObjectSchemaInfo("TrainingSessionProgram");
            this.idColKey = addColumnDetails("id", "id", objectSchemaInfo);
            this.titleColKey = addColumnDetails("title", "title", objectSchemaInfo);
            this.descriptionColKey = addColumnDetails("description", "description", objectSchemaInfo);
            this.programListColKey = addColumnDetails("programList", "programList", objectSchemaInfo);
            this.startDateColKey = addColumnDetails("startDate", "startDate", objectSchemaInfo);
            this.activeColKey = addColumnDetails("active", "active", objectSchemaInfo);
        }

        TrainingSessionProgramColumnInfo(ColumnInfo src, boolean mutable) {
            super(src, mutable);
            copy(src, this);
        }

        @Override
        protected final ColumnInfo copy(boolean mutable) {
            return new TrainingSessionProgramColumnInfo(this, mutable);
        }

        @Override
        protected final void copy(ColumnInfo rawSrc, ColumnInfo rawDst) {
            final TrainingSessionProgramColumnInfo src = (TrainingSessionProgramColumnInfo) rawSrc;
            final TrainingSessionProgramColumnInfo dst = (TrainingSessionProgramColumnInfo) rawDst;
            dst.idColKey = src.idColKey;
            dst.titleColKey = src.titleColKey;
            dst.descriptionColKey = src.descriptionColKey;
            dst.programListColKey = src.programListColKey;
            dst.startDateColKey = src.startDateColKey;
            dst.activeColKey = src.activeColKey;
        }
    }

    private static final String NO_ALIAS = "";
    private static final OsObjectSchemaInfo expectedObjectSchemaInfo = createExpectedObjectSchemaInfo();

    private TrainingSessionProgramColumnInfo columnInfo;
    private ProxyState<it.ninespartans.xmanager.model.TrainingSessionProgram> proxyState;
    private RealmList<it.ninespartans.xmanager.model.Program> programListRealmList;

    it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy() {
        proxyState.setConstructionFinished();
    }

    @Override
    public void realm$injectObjectContext() {
        if (this.proxyState != null) {
            return;
        }
        final BaseRealm.RealmObjectContext context = BaseRealm.objectContext.get();
        this.columnInfo = (TrainingSessionProgramColumnInfo) context.getColumnInfo();
        this.proxyState = new ProxyState<it.ninespartans.xmanager.model.TrainingSessionProgram>(this);
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
    public String realmGet$title() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.titleColKey);
    }

    @Override
    public void realmSet$title(String value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'title' to null.");
            }
            row.getTable().setString(columnInfo.titleColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'title' to null.");
        }
        proxyState.getRow$realm().setString(columnInfo.titleColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$description() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.descriptionColKey);
    }

    @Override
    public void realmSet$description(String value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'description' to null.");
            }
            row.getTable().setString(columnInfo.descriptionColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'description' to null.");
        }
        proxyState.getRow$realm().setString(columnInfo.descriptionColKey, value);
    }

    @Override
    public RealmList<it.ninespartans.xmanager.model.Program> realmGet$programList() {
        proxyState.getRealm$realm().checkIfValid();
        // use the cached value if available
        if (programListRealmList != null) {
            return programListRealmList;
        } else {
            OsList osList = proxyState.getRow$realm().getModelList(columnInfo.programListColKey);
            programListRealmList = new RealmList<it.ninespartans.xmanager.model.Program>(it.ninespartans.xmanager.model.Program.class, osList, proxyState.getRealm$realm());
            return programListRealmList;
        }
    }

    @Override
    public void realmSet$programList(RealmList<it.ninespartans.xmanager.model.Program> value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            if (proxyState.getExcludeFields$realm().contains("programList")) {
                return;
            }
            // if the list contains unmanaged RealmObjects, convert them to managed.
            if (value != null && !value.isManaged()) {
                final Realm realm = (Realm) proxyState.getRealm$realm();
                final RealmList<it.ninespartans.xmanager.model.Program> original = value;
                value = new RealmList<it.ninespartans.xmanager.model.Program>();
                for (it.ninespartans.xmanager.model.Program item : original) {
                    if (item == null || RealmObject.isManaged(item)) {
                        value.add(item);
                    } else {
                        value.add(realm.copyToRealm(item));
                    }
                }
            }
        }

        proxyState.getRealm$realm().checkIfValid();
        OsList osList = proxyState.getRow$realm().getModelList(columnInfo.programListColKey);
        // For lists of equal lengths, we need to set each element directly as clearing the receiver list can be wrong if the input and target list are the same.
        if (value != null && value.size() == osList.size()) {
            int objects = value.size();
            for (int i = 0; i < objects; i++) {
                it.ninespartans.xmanager.model.Program linkedObject = value.get(i);
                proxyState.checkValidObject(linkedObject);
                osList.setRow(i, ((RealmObjectProxy) linkedObject).realmGet$proxyState().getRow$realm().getObjectKey());
            }
        } else {
            osList.removeAll();
            if (value == null) {
                return;
            }
            int objects = value.size();
            for (int i = 0; i < objects; i++) {
                it.ninespartans.xmanager.model.Program linkedObject = value.get(i);
                proxyState.checkValidObject(linkedObject);
                osList.addRow(((RealmObjectProxy) linkedObject).realmGet$proxyState().getRow$realm().getObjectKey());
            }
        }
    }

    @Override
    @SuppressWarnings("cast")
    public Date realmGet$startDate() {
        proxyState.getRealm$realm().checkIfValid();
        if (proxyState.getRow$realm().isNull(columnInfo.startDateColKey)) {
            return null;
        }
        return (java.util.Date) proxyState.getRow$realm().getDate(columnInfo.startDateColKey);
    }

    @Override
    public void realmSet$startDate(Date value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                row.getTable().setNull(columnInfo.startDateColKey, row.getObjectKey(), true);
                return;
            }
            row.getTable().setDate(columnInfo.startDateColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            proxyState.getRow$realm().setNull(columnInfo.startDateColKey);
            return;
        }
        proxyState.getRow$realm().setDate(columnInfo.startDateColKey, value);
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
        OsObjectSchemaInfo.Builder builder = new OsObjectSchemaInfo.Builder(NO_ALIAS, "TrainingSessionProgram", false, 6, 0);
        builder.addPersistedProperty(NO_ALIAS, "id", RealmFieldType.STRING, Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "title", RealmFieldType.STRING, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "description", RealmFieldType.STRING, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedLinkProperty(NO_ALIAS, "programList", RealmFieldType.LIST, "Program");
        builder.addPersistedProperty(NO_ALIAS, "startDate", RealmFieldType.DATE, !Property.PRIMARY_KEY, !Property.INDEXED, !Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "active", RealmFieldType.BOOLEAN, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        return builder.build();
    }

    public static OsObjectSchemaInfo getExpectedObjectSchemaInfo() {
        return expectedObjectSchemaInfo;
    }

    public static TrainingSessionProgramColumnInfo createColumnInfo(OsSchemaInfo schemaInfo) {
        return new TrainingSessionProgramColumnInfo(schemaInfo);
    }

    public static String getSimpleClassName() {
        return "TrainingSessionProgram";
    }

    public static final class ClassNameHelper {
        public static final String INTERNAL_CLASS_NAME = "TrainingSessionProgram";
    }

    @SuppressWarnings("cast")
    public static it.ninespartans.xmanager.model.TrainingSessionProgram createOrUpdateUsingJsonObject(Realm realm, JSONObject json, boolean update)
        throws JSONException {
        final List<String> excludeFields = new ArrayList<String>(1);
        it.ninespartans.xmanager.model.TrainingSessionProgram obj = null;
        if (update) {
            Table table = realm.getTable(it.ninespartans.xmanager.model.TrainingSessionProgram.class);
            TrainingSessionProgramColumnInfo columnInfo = (TrainingSessionProgramColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.TrainingSessionProgram.class);
            long pkColumnKey = columnInfo.idColKey;
            long objKey = Table.NO_MATCH;
            if (!json.isNull("id")) {
                objKey = table.findFirstString(pkColumnKey, json.getString("id"));
            }
            if (objKey != Table.NO_MATCH) {
                final BaseRealm.RealmObjectContext objectContext = BaseRealm.objectContext.get();
                try {
                    objectContext.set(realm, table.getUncheckedRow(objKey), realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.TrainingSessionProgram.class), false, Collections.<String> emptyList());
                    obj = new io.realm.it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy();
                } finally {
                    objectContext.clear();
                }
            }
        }
        if (obj == null) {
            if (json.has("programList")) {
                excludeFields.add("programList");
            }
            if (json.has("id")) {
                if (json.isNull("id")) {
                    obj = (io.realm.it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy) realm.createObjectInternal(it.ninespartans.xmanager.model.TrainingSessionProgram.class, null, true, excludeFields);
                } else {
                    obj = (io.realm.it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy) realm.createObjectInternal(it.ninespartans.xmanager.model.TrainingSessionProgram.class, json.getString("id"), true, excludeFields);
                }
            } else {
                throw new IllegalArgumentException("JSON object doesn't have the primary key field 'id'.");
            }
        }

        final it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface objProxy = (it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) obj;
        if (json.has("title")) {
            if (json.isNull("title")) {
                objProxy.realmSet$title(null);
            } else {
                objProxy.realmSet$title((String) json.getString("title"));
            }
        }
        if (json.has("description")) {
            if (json.isNull("description")) {
                objProxy.realmSet$description(null);
            } else {
                objProxy.realmSet$description((String) json.getString("description"));
            }
        }
        if (json.has("programList")) {
            if (json.isNull("programList")) {
                objProxy.realmSet$programList(null);
            } else {
                objProxy.realmGet$programList().clear();
                JSONArray array = json.getJSONArray("programList");
                for (int i = 0; i < array.length(); i++) {
                    it_ninespartans_xmanager_model_ProgramRealmProxy.createOrUpdateEmbeddedUsingJsonObject(realm, (RealmModel)objProxy, "programList", array.getJSONObject(i), update);
                }
            }
        }
        if (json.has("startDate")) {
            if (json.isNull("startDate")) {
                objProxy.realmSet$startDate(null);
            } else {
                Object timestamp = json.get("startDate");
                if (timestamp instanceof String) {
                    objProxy.realmSet$startDate(JsonUtils.stringToDate((String) timestamp));
                } else {
                    objProxy.realmSet$startDate(new Date(json.getLong("startDate")));
                }
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
    public static it.ninespartans.xmanager.model.TrainingSessionProgram createUsingJsonStream(Realm realm, JsonReader reader)
        throws IOException {
        boolean jsonHasPrimaryKey = false;
        final it.ninespartans.xmanager.model.TrainingSessionProgram obj = new it.ninespartans.xmanager.model.TrainingSessionProgram();
        final it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface objProxy = (it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) obj;
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
            } else if (name.equals("title")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$title((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$title(null);
                }
            } else if (name.equals("description")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$description((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$description(null);
                }
            } else if (name.equals("programList")) {
                if (reader.peek() == JsonToken.NULL) {
                    reader.skipValue();
                    objProxy.realmSet$programList(null);
                } else {
                    objProxy.realmSet$programList(new RealmList<it.ninespartans.xmanager.model.Program>());
                    reader.beginArray();
                    while (reader.hasNext()) {
                        it.ninespartans.xmanager.model.Program item = it_ninespartans_xmanager_model_ProgramRealmProxy.createUsingJsonStream(realm, reader);
                        objProxy.realmGet$programList().add(item);
                    }
                    reader.endArray();
                }
            } else if (name.equals("startDate")) {
                if (reader.peek() == JsonToken.NULL) {
                    reader.skipValue();
                    objProxy.realmSet$startDate(null);
                } else if (reader.peek() == JsonToken.NUMBER) {
                    long timestamp = reader.nextLong();
                    if (timestamp > -1) {
                        objProxy.realmSet$startDate(new Date(timestamp));
                    }
                } else {
                    objProxy.realmSet$startDate(JsonUtils.stringToDate(reader.nextString()));
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

    static it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy newProxyInstance(BaseRealm realm, Row row) {
        // Ignore default values to avoid creating unexpected objects from RealmModel/RealmList fields
        final BaseRealm.RealmObjectContext objectContext = BaseRealm.objectContext.get();
        objectContext.set(realm, row, realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.TrainingSessionProgram.class), false, Collections.<String>emptyList());
        io.realm.it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy obj = new io.realm.it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy();
        objectContext.clear();
        return obj;
    }

    public static it.ninespartans.xmanager.model.TrainingSessionProgram copyOrUpdate(Realm realm, TrainingSessionProgramColumnInfo columnInfo, it.ninespartans.xmanager.model.TrainingSessionProgram object, boolean update, Map<RealmModel,RealmObjectProxy> cache, Set<ImportFlag> flags) {
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
            return (it.ninespartans.xmanager.model.TrainingSessionProgram) cachedRealmObject;
        }

        it.ninespartans.xmanager.model.TrainingSessionProgram realmObject = null;
        boolean canUpdate = update;
        if (canUpdate) {
            Table table = realm.getTable(it.ninespartans.xmanager.model.TrainingSessionProgram.class);
            long pkColumnKey = columnInfo.idColKey;
            long objKey = table.findFirstString(pkColumnKey, ((it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) object).realmGet$id());
            if (objKey == Table.NO_MATCH) {
                canUpdate = false;
            } else {
                try {
                    objectContext.set(realm, table.getUncheckedRow(objKey), columnInfo, false, Collections.<String> emptyList());
                    realmObject = new io.realm.it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy();
                    cache.put(object, (RealmObjectProxy) realmObject);
                } finally {
                    objectContext.clear();
                }
            }
        }

        return (canUpdate) ? update(realm, columnInfo, realmObject, object, cache, flags) : copy(realm, columnInfo, object, update, cache, flags);
    }

    public static it.ninespartans.xmanager.model.TrainingSessionProgram copy(Realm realm, TrainingSessionProgramColumnInfo columnInfo, it.ninespartans.xmanager.model.TrainingSessionProgram newObject, boolean update, Map<RealmModel,RealmObjectProxy> cache, Set<ImportFlag> flags) {
        RealmObjectProxy cachedRealmObject = cache.get(newObject);
        if (cachedRealmObject != null) {
            return (it.ninespartans.xmanager.model.TrainingSessionProgram) cachedRealmObject;
        }

        it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface unmanagedSource = (it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) newObject;

        Table table = realm.getTable(it.ninespartans.xmanager.model.TrainingSessionProgram.class);
        OsObjectBuilder builder = new OsObjectBuilder(table, flags);

        // Add all non-"object reference" fields
        builder.addString(columnInfo.idColKey, unmanagedSource.realmGet$id());
        builder.addString(columnInfo.titleColKey, unmanagedSource.realmGet$title());
        builder.addString(columnInfo.descriptionColKey, unmanagedSource.realmGet$description());
        builder.addDate(columnInfo.startDateColKey, unmanagedSource.realmGet$startDate());
        builder.addBoolean(columnInfo.activeColKey, unmanagedSource.realmGet$active());

        // Create the underlying object and cache it before setting any object/objectlist references
        // This will allow us to break any circular dependencies by using the object cache.
        Row row = builder.createNewObject();
        io.realm.it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy managedCopy = newProxyInstance(realm, row);
        cache.put(newObject, managedCopy);

        // Finally add all fields that reference other Realm Objects, either directly or through a list
        RealmList<it.ninespartans.xmanager.model.Program> programListUnmanagedList = unmanagedSource.realmGet$programList();
        if (programListUnmanagedList != null) {
            RealmList<it.ninespartans.xmanager.model.Program> programListManagedList = managedCopy.realmGet$programList();
            programListManagedList.clear();
            for (int i = 0; i < programListUnmanagedList.size(); i++) {
                it.ninespartans.xmanager.model.Program programListUnmanagedItem = programListUnmanagedList.get(i);
                it.ninespartans.xmanager.model.Program cacheprogramList = (it.ninespartans.xmanager.model.Program) cache.get(programListUnmanagedItem);
                if (cacheprogramList != null) {
                    throw new IllegalArgumentException("Embedded objects can only have one parent pointing to them. This object was already copied, so another object is pointing to it: cacheprogramList.toString()");
                } else {
                    long objKey = programListManagedList.getOsList().createAndAddEmbeddedObject();
                    Row linkedObjectRow = realm.getTable(it.ninespartans.xmanager.model.Program.class).getUncheckedRow(objKey);
                    it.ninespartans.xmanager.model.Program linkedObject = it_ninespartans_xmanager_model_ProgramRealmProxy.newProxyInstance(realm, linkedObjectRow);
                    cache.put(programListUnmanagedItem, (RealmObjectProxy) linkedObject);
                    it_ninespartans_xmanager_model_ProgramRealmProxy.updateEmbeddedObject(realm, programListUnmanagedItem, linkedObject, new HashMap<RealmModel, RealmObjectProxy>(), Collections.EMPTY_SET);
                }
            }
        }

        return managedCopy;
    }

    public static long insert(Realm realm, it.ninespartans.xmanager.model.TrainingSessionProgram object, Map<RealmModel,Long> cache) {
        if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
            return ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey();
        }
        Table table = realm.getTable(it.ninespartans.xmanager.model.TrainingSessionProgram.class);
        long tableNativePtr = table.getNativePtr();
        TrainingSessionProgramColumnInfo columnInfo = (TrainingSessionProgramColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.TrainingSessionProgram.class);
        long pkColumnKey = columnInfo.idColKey;
        long objKey = Table.NO_MATCH;
        Object primaryKeyValue = ((it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) object).realmGet$id();
        if (primaryKeyValue != null) {
            objKey = Table.nativeFindFirstString(tableNativePtr, pkColumnKey, (String)primaryKeyValue);
        }
        if (objKey == Table.NO_MATCH) {
            objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
        } else {
            Table.throwDuplicatePrimaryKeyException(primaryKeyValue);
        }
        cache.put(object, objKey);
        String realmGet$title = ((it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) object).realmGet$title();
        if (realmGet$title != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.titleColKey, objKey, realmGet$title, false);
        }
        String realmGet$description = ((it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) object).realmGet$description();
        if (realmGet$description != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.descriptionColKey, objKey, realmGet$description, false);
        }

        RealmList<it.ninespartans.xmanager.model.Program> programListList = ((it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) object).realmGet$programList();
        if (programListList != null) {
            OsList programListOsList = new OsList(table.getUncheckedRow(objKey), columnInfo.programListColKey);
            for (it.ninespartans.xmanager.model.Program programListItem : programListList) {
                Long cacheItemIndexprogramList = cache.get(programListItem);
                if (cacheItemIndexprogramList != null) {
                    throw new IllegalArgumentException("Embedded objects can only have one parent pointing to them. This object was already copied, so another object is pointing to it: " + cacheItemIndexprogramList.toString());
                } else {
                    cacheItemIndexprogramList = it_ninespartans_xmanager_model_ProgramRealmProxy.insert(realm, table, columnInfo.programListColKey, objKey, programListItem, cache);
                }
            }
        }
        java.util.Date realmGet$startDate = ((it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) object).realmGet$startDate();
        if (realmGet$startDate != null) {
            Table.nativeSetTimestamp(tableNativePtr, columnInfo.startDateColKey, objKey, realmGet$startDate.getTime(), false);
        }
        Table.nativeSetBoolean(tableNativePtr, columnInfo.activeColKey, objKey, ((it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) object).realmGet$active(), false);
        return objKey;
    }

    public static void insert(Realm realm, Iterator<? extends RealmModel> objects, Map<RealmModel,Long> cache) {
        Table table = realm.getTable(it.ninespartans.xmanager.model.TrainingSessionProgram.class);
        long tableNativePtr = table.getNativePtr();
        TrainingSessionProgramColumnInfo columnInfo = (TrainingSessionProgramColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.TrainingSessionProgram.class);
        long pkColumnKey = columnInfo.idColKey;
        it.ninespartans.xmanager.model.TrainingSessionProgram object = null;
        while (objects.hasNext()) {
            object = (it.ninespartans.xmanager.model.TrainingSessionProgram) objects.next();
            if (cache.containsKey(object)) {
                continue;
            }
            if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
                cache.put(object, ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey());
                continue;
            }
            long objKey = Table.NO_MATCH;
            Object primaryKeyValue = ((it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) object).realmGet$id();
            if (primaryKeyValue != null) {
                objKey = Table.nativeFindFirstString(tableNativePtr, pkColumnKey, (String)primaryKeyValue);
            }
            if (objKey == Table.NO_MATCH) {
                objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
            } else {
                Table.throwDuplicatePrimaryKeyException(primaryKeyValue);
            }
            cache.put(object, objKey);
            String realmGet$title = ((it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) object).realmGet$title();
            if (realmGet$title != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.titleColKey, objKey, realmGet$title, false);
            }
            String realmGet$description = ((it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) object).realmGet$description();
            if (realmGet$description != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.descriptionColKey, objKey, realmGet$description, false);
            }

            RealmList<it.ninespartans.xmanager.model.Program> programListList = ((it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) object).realmGet$programList();
            if (programListList != null) {
                OsList programListOsList = new OsList(table.getUncheckedRow(objKey), columnInfo.programListColKey);
                for (it.ninespartans.xmanager.model.Program programListItem : programListList) {
                    Long cacheItemIndexprogramList = cache.get(programListItem);
                    if (cacheItemIndexprogramList != null) {
                        throw new IllegalArgumentException("Embedded objects can only have one parent pointing to them. This object was already copied, so another object is pointing to it: " + cacheItemIndexprogramList.toString());
                    } else {
                        cacheItemIndexprogramList = it_ninespartans_xmanager_model_ProgramRealmProxy.insert(realm, table, columnInfo.programListColKey, objKey, programListItem, cache);
                    }
                }
            }
            java.util.Date realmGet$startDate = ((it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) object).realmGet$startDate();
            if (realmGet$startDate != null) {
                Table.nativeSetTimestamp(tableNativePtr, columnInfo.startDateColKey, objKey, realmGet$startDate.getTime(), false);
            }
            Table.nativeSetBoolean(tableNativePtr, columnInfo.activeColKey, objKey, ((it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) object).realmGet$active(), false);
        }
    }

    public static long insertOrUpdate(Realm realm, it.ninespartans.xmanager.model.TrainingSessionProgram object, Map<RealmModel,Long> cache) {
        if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
            return ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey();
        }
        Table table = realm.getTable(it.ninespartans.xmanager.model.TrainingSessionProgram.class);
        long tableNativePtr = table.getNativePtr();
        TrainingSessionProgramColumnInfo columnInfo = (TrainingSessionProgramColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.TrainingSessionProgram.class);
        long pkColumnKey = columnInfo.idColKey;
        long objKey = Table.NO_MATCH;
        Object primaryKeyValue = ((it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) object).realmGet$id();
        if (primaryKeyValue != null) {
            objKey = Table.nativeFindFirstString(tableNativePtr, pkColumnKey, (String)primaryKeyValue);
        }
        if (objKey == Table.NO_MATCH) {
            objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
        }
        cache.put(object, objKey);
        String realmGet$title = ((it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) object).realmGet$title();
        if (realmGet$title != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.titleColKey, objKey, realmGet$title, false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.titleColKey, objKey, false);
        }
        String realmGet$description = ((it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) object).realmGet$description();
        if (realmGet$description != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.descriptionColKey, objKey, realmGet$description, false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.descriptionColKey, objKey, false);
        }

        OsList programListOsList = new OsList(table.getUncheckedRow(objKey), columnInfo.programListColKey);
        RealmList<it.ninespartans.xmanager.model.Program> programListList = ((it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) object).realmGet$programList();
        programListOsList.removeAll();
        if (programListList != null) {
            for (it.ninespartans.xmanager.model.Program programListItem : programListList) {
                Long cacheItemIndexprogramList = cache.get(programListItem);
                if (cacheItemIndexprogramList != null) {
                    throw new IllegalArgumentException("Embedded objects can only have one parent pointing to them. This object was already copied, so another object is pointing to it: " + cacheItemIndexprogramList.toString());
                } else {
                    cacheItemIndexprogramList = it_ninespartans_xmanager_model_ProgramRealmProxy.insertOrUpdate(realm, table, columnInfo.programListColKey, objKey, programListItem, cache);
                }
            }
        }

        java.util.Date realmGet$startDate = ((it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) object).realmGet$startDate();
        if (realmGet$startDate != null) {
            Table.nativeSetTimestamp(tableNativePtr, columnInfo.startDateColKey, objKey, realmGet$startDate.getTime(), false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.startDateColKey, objKey, false);
        }
        Table.nativeSetBoolean(tableNativePtr, columnInfo.activeColKey, objKey, ((it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) object).realmGet$active(), false);
        return objKey;
    }

    public static void insertOrUpdate(Realm realm, Iterator<? extends RealmModel> objects, Map<RealmModel,Long> cache) {
        Table table = realm.getTable(it.ninespartans.xmanager.model.TrainingSessionProgram.class);
        long tableNativePtr = table.getNativePtr();
        TrainingSessionProgramColumnInfo columnInfo = (TrainingSessionProgramColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.TrainingSessionProgram.class);
        long pkColumnKey = columnInfo.idColKey;
        it.ninespartans.xmanager.model.TrainingSessionProgram object = null;
        while (objects.hasNext()) {
            object = (it.ninespartans.xmanager.model.TrainingSessionProgram) objects.next();
            if (cache.containsKey(object)) {
                continue;
            }
            if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
                cache.put(object, ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey());
                continue;
            }
            long objKey = Table.NO_MATCH;
            Object primaryKeyValue = ((it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) object).realmGet$id();
            if (primaryKeyValue != null) {
                objKey = Table.nativeFindFirstString(tableNativePtr, pkColumnKey, (String)primaryKeyValue);
            }
            if (objKey == Table.NO_MATCH) {
                objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
            }
            cache.put(object, objKey);
            String realmGet$title = ((it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) object).realmGet$title();
            if (realmGet$title != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.titleColKey, objKey, realmGet$title, false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.titleColKey, objKey, false);
            }
            String realmGet$description = ((it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) object).realmGet$description();
            if (realmGet$description != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.descriptionColKey, objKey, realmGet$description, false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.descriptionColKey, objKey, false);
            }

            OsList programListOsList = new OsList(table.getUncheckedRow(objKey), columnInfo.programListColKey);
            RealmList<it.ninespartans.xmanager.model.Program> programListList = ((it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) object).realmGet$programList();
            programListOsList.removeAll();
            if (programListList != null) {
                for (it.ninespartans.xmanager.model.Program programListItem : programListList) {
                    Long cacheItemIndexprogramList = cache.get(programListItem);
                    if (cacheItemIndexprogramList != null) {
                        throw new IllegalArgumentException("Embedded objects can only have one parent pointing to them. This object was already copied, so another object is pointing to it: " + cacheItemIndexprogramList.toString());
                    } else {
                        cacheItemIndexprogramList = it_ninespartans_xmanager_model_ProgramRealmProxy.insertOrUpdate(realm, table, columnInfo.programListColKey, objKey, programListItem, cache);
                    }
                }
            }

            java.util.Date realmGet$startDate = ((it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) object).realmGet$startDate();
            if (realmGet$startDate != null) {
                Table.nativeSetTimestamp(tableNativePtr, columnInfo.startDateColKey, objKey, realmGet$startDate.getTime(), false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.startDateColKey, objKey, false);
            }
            Table.nativeSetBoolean(tableNativePtr, columnInfo.activeColKey, objKey, ((it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) object).realmGet$active(), false);
        }
    }

    public static it.ninespartans.xmanager.model.TrainingSessionProgram createDetachedCopy(it.ninespartans.xmanager.model.TrainingSessionProgram realmObject, int currentDepth, int maxDepth, Map<RealmModel, CacheData<RealmModel>> cache) {
        if (currentDepth > maxDepth || realmObject == null) {
            return null;
        }
        CacheData<RealmModel> cachedObject = cache.get(realmObject);
        it.ninespartans.xmanager.model.TrainingSessionProgram unmanagedObject;
        if (cachedObject == null) {
            unmanagedObject = new it.ninespartans.xmanager.model.TrainingSessionProgram();
            cache.put(realmObject, new RealmObjectProxy.CacheData<RealmModel>(currentDepth, unmanagedObject));
        } else {
            // Reuse cached object or recreate it because it was encountered at a lower depth.
            if (currentDepth >= cachedObject.minDepth) {
                return (it.ninespartans.xmanager.model.TrainingSessionProgram) cachedObject.object;
            }
            unmanagedObject = (it.ninespartans.xmanager.model.TrainingSessionProgram) cachedObject.object;
            cachedObject.minDepth = currentDepth;
        }
        it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface unmanagedCopy = (it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) unmanagedObject;
        it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface realmSource = (it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) realmObject;
        Realm objectRealm = (Realm) ((RealmObjectProxy) realmObject).realmGet$proxyState().getRealm$realm();
        unmanagedCopy.realmSet$id(realmSource.realmGet$id());
        unmanagedCopy.realmSet$title(realmSource.realmGet$title());
        unmanagedCopy.realmSet$description(realmSource.realmGet$description());

        // Deep copy of programList
        if (currentDepth == maxDepth) {
            unmanagedCopy.realmSet$programList(null);
        } else {
            RealmList<it.ninespartans.xmanager.model.Program> managedprogramListList = realmSource.realmGet$programList();
            RealmList<it.ninespartans.xmanager.model.Program> unmanagedprogramListList = new RealmList<it.ninespartans.xmanager.model.Program>();
            unmanagedCopy.realmSet$programList(unmanagedprogramListList);
            int nextDepth = currentDepth + 1;
            int size = managedprogramListList.size();
            for (int i = 0; i < size; i++) {
                it.ninespartans.xmanager.model.Program item = it_ninespartans_xmanager_model_ProgramRealmProxy.createDetachedCopy(managedprogramListList.get(i), nextDepth, maxDepth, cache);
                unmanagedprogramListList.add(item);
            }
        }
        unmanagedCopy.realmSet$startDate(realmSource.realmGet$startDate());
        unmanagedCopy.realmSet$active(realmSource.realmGet$active());

        return unmanagedObject;
    }

    static it.ninespartans.xmanager.model.TrainingSessionProgram update(Realm realm, TrainingSessionProgramColumnInfo columnInfo, it.ninespartans.xmanager.model.TrainingSessionProgram realmObject, it.ninespartans.xmanager.model.TrainingSessionProgram newObject, Map<RealmModel, RealmObjectProxy> cache, Set<ImportFlag> flags) {
        it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface realmObjectTarget = (it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) realmObject;
        it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface realmObjectSource = (it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxyInterface) newObject;
        Table table = realm.getTable(it.ninespartans.xmanager.model.TrainingSessionProgram.class);
        OsObjectBuilder builder = new OsObjectBuilder(table, flags);
        builder.addString(columnInfo.idColKey, realmObjectSource.realmGet$id());
        builder.addString(columnInfo.titleColKey, realmObjectSource.realmGet$title());
        builder.addString(columnInfo.descriptionColKey, realmObjectSource.realmGet$description());

        RealmList<it.ninespartans.xmanager.model.Program> programListUnmanagedList = realmObjectSource.realmGet$programList();
        if (programListUnmanagedList != null) {
            RealmList<it.ninespartans.xmanager.model.Program> programListManagedCopy = new RealmList<it.ninespartans.xmanager.model.Program>();
            OsList targetList = realmObjectTarget.realmGet$programList().getOsList();
            targetList.deleteAll();
            for (int i = 0; i < programListUnmanagedList.size(); i++) {
                it.ninespartans.xmanager.model.Program programListUnmanagedItem = programListUnmanagedList.get(i);
                it.ninespartans.xmanager.model.Program cacheprogramList = (it.ninespartans.xmanager.model.Program) cache.get(programListUnmanagedItem);
                if (cacheprogramList != null) {
                    throw new IllegalArgumentException("Embedded objects can only have one parent pointing to them. This object was already copied, so another object is pointing to it: cacheprogramList.toString()");
                } else {
                    long objKey = targetList.createAndAddEmbeddedObject();
                    Row row = realm.getTable(it.ninespartans.xmanager.model.Program.class).getUncheckedRow(objKey);
                    it.ninespartans.xmanager.model.Program proxyObject = it_ninespartans_xmanager_model_ProgramRealmProxy.newProxyInstance(realm, row);
                    cache.put(programListUnmanagedItem, (RealmObjectProxy) proxyObject);
                    programListManagedCopy.add(proxyObject);
                    it_ninespartans_xmanager_model_ProgramRealmProxy.updateEmbeddedObject(realm, programListUnmanagedItem, proxyObject, new HashMap<RealmModel, RealmObjectProxy>(), Collections.EMPTY_SET);
                }
            }
        } else {
            builder.addObjectList(columnInfo.programListColKey, new RealmList<it.ninespartans.xmanager.model.Program>());
        }
        builder.addDate(columnInfo.startDateColKey, realmObjectSource.realmGet$startDate());
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
        StringBuilder stringBuilder = new StringBuilder("TrainingSessionProgram = proxy[");
        stringBuilder.append("{id:");
        stringBuilder.append(realmGet$id());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{title:");
        stringBuilder.append(realmGet$title());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{description:");
        stringBuilder.append(realmGet$description());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{programList:");
        stringBuilder.append("RealmList<Program>[").append(realmGet$programList().size()).append("]");
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{startDate:");
        stringBuilder.append(realmGet$startDate() != null ? realmGet$startDate() : "null");
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
        it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy aTrainingSessionProgram = (it_ninespartans_xmanager_model_TrainingSessionProgramRealmProxy)o;

        BaseRealm realm = proxyState.getRealm$realm();
        BaseRealm otherRealm = aTrainingSessionProgram.proxyState.getRealm$realm();
        String path = realm.getPath();
        String otherPath = otherRealm.getPath();
        if (path != null ? !path.equals(otherPath) : otherPath != null) return false;
        if (realm.isFrozen() != otherRealm.isFrozen()) return false;
        if (!realm.sharedRealm.getVersionID().equals(otherRealm.sharedRealm.getVersionID())) {
            return false;
        }

        String tableName = proxyState.getRow$realm().getTable().getName();
        String otherTableName = aTrainingSessionProgram.proxyState.getRow$realm().getTable().getName();
        if (tableName != null ? !tableName.equals(otherTableName) : otherTableName != null) return false;

        if (proxyState.getRow$realm().getObjectKey() != aTrainingSessionProgram.proxyState.getRow$realm().getObjectKey()) return false;

        return true;
    }
}
